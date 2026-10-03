class SyncItemToStripeJob < ApplicationJob
  queue_as :default

  def perform(item_id:)
    temp = ::StripeItem.find(item_id)
    return nil unless temp.present?

  prod = Stripe::Product.create({
      name: temp.name,
      description: temp.description
    })
  price = Stripe::Price.create({
      product: prod.id,
      unit_amount: temp.price_cents,
      currency: 'usd'
    })
    temp.update(stripe_product_id: prod.id, stripe_price_id: price.id)  
  end
end
