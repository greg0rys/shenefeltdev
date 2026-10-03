class StripeCustomer < ApplicationRecord
    has_many :stripe_purchases, dependent: :destroy 
    has_many :stripe_carts, dependent: :destroy 
end
