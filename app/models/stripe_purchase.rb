class StripePurchase < ApplicationRecord
  belongs_to :stripe_customer
  has_many :stripe_purchase_items, dependent: :destroy 
  
end
