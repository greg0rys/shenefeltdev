class StripeCartItem < ApplicationRecord
  belongs_to :stripe_cart
  belongs_to :stripe_item
end
