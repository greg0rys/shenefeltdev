class StripeItemService
  def self.call(stripe_purchase)
    new(stripe_purchase).call
  end

  def initialize(stripe_purchase)
    @purchase = stripe_purchase
  end

  def call
    return false if @purchase.completed?

    StripePurchase.transaction do
      @purchase.stripe_purchase_items.includes(:stripe_item).each do |line_item|
        item = line_item.stripe_item
        qty = line_item.quantity || 0
        
    
        dollar_amt = Money.from_cents(
                        ( qty * (line_item.unit_price_cents || 0) )
                    )

        sale = item.find_or_create_sale!

        sale.increment!(:total_amt_sold, qty)
        sale.increment!(:sales_total, line_item_dollar_total)
      end

      @purchase.update!(completed: true)
    end

    true
  rescue StandardError => e
    Rails.logger.error("[Fulfillment Failed] Purchase #{@purchase.id}: #{e.message}")
    false
  end
end