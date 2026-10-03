# Push customer up to Stripe when creation occurs 
class SyncCustomerToStripeJob
  include Sidekiq::Job

  def perform(customer_id:)
    return nil if customer_id.blank?

    customer = Customer.find_by(id: customer_id)
    return nil unless customer.present?


    temp = Stripe::Customer.create({
      email: customer.email,
      name: customer.name
    })

    
    customer.update!(stripe_customer_id:temp&.id) 
  end

  
end
