class StripePurchaseJob
  include Sidekiq::Job

  sidekiq_options(
    queue: :purchases,
    retry: 5,
    backtrace: true,
    dead: false
  )

  TYPES = %w[intent partial_refund full_refund checkout_session].freeze

  def perform(purchase_id:, type:, opt_data: nil)
    return if purchase_id.blank? || !TYPES.include?(type)

    purchase = StripePurchase.find_by(id: purchase_id)
    return if purchase.blank?

    case type
    when "intent"
      create_payment_intent(purchase: purchase)

    when "full_refund_purchase"
      Refund.create(
        stripe_purchase_id: purchase.id, 
        amount_cents: purchase.amount_cents, 
        stripe_refund_id: refund_full_purchase(purchase: purchase)
      )

    when "partial_refund_purchase"
      return if opt_data.nil?
      Refund.create(
        stripe_purchase_id: purchase.id, 
        amount_cents: purchase.amount_cents, 
        stripe_refund_id: partial_refund_purchase(purchase: purchase, partial_amount: refund_amnt)
      )

    when "checkout_session"
      init_checkout(purchase: purchase)
    end
  end

  private

  def create_payment_intent(purchase:)

    payment_intent = Stripe::PaymentIntent.create(
      amount: purchase.amount_cents,
      currency: purchase.currency,
      customer: purchase.stripe_customer&.stripe_customer_id,
      metadata: {
        order_id: purchase.id,
        customer_id: purchase.stripe_customer_id
      },
      automatic_payment_methods: { enabled: true }
    )

    purchase.update!(stripe_payment_intent_id: payment_intent.id)
  rescue Stripe::StripeError => e
    Rails.logger.error("Error with payment intent #{e.message}")
    raise
  end

  def full_refund_purchase(purchase:)
    return nill unless purchase.present?


    Refund.create(stripe_purchase_id: purchase.id, 
                  amount_cents: purchase.amount_cents, 
                  stripe_refund_id: Stripe::Refund.create({
                    payment_intent: purchase.stripe_payment_intent_id
                  })
    )


  end

  def partial_refund_purchase(purchase:, partial_amount:)
  end

  def init_checkout(purchase:)
  end
end
