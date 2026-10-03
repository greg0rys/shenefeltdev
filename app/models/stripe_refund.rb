class StripeRefund < ApplicationRecord
  belongs_to :stripe_customer
end
