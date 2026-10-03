class StripePurchaseItem < ApplicationRecord
  belongs_to :stripe_purchase
  belongs_to :stripe_item
end
