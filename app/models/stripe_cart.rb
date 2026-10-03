class StripeCart < ApplicationRecord
  belongs_to :stripe_customer
  has_many :stripe_cart_items, dependent: :destroy
  has_many :stripe_items, through: :stripe_cart_items
  
end
