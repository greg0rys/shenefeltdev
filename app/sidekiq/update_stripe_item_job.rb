class UpdateStripeItemJob
  include Sidekiq::Job

  def perform(stripe_id:, update_type:)
    return nil if stripe_id.blank?

    item = StripeItem.find_by(stripe_product_id: stripe_id)
    return nil unless item.present?

    case update_type
    when :update
      # Handle update logic
 end
  end
end
