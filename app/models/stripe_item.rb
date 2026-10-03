class StripeItem < ApplicationRecord
  has_one :stripe_item_sale, dependent: :destroy
  has_many :stripe_cart_items, dependent: :destroy 
  has_many :stripe_purchase_items, dependent: :nullify
  has_many :purchases, through: :purchase_items 
  has_many_attached :images

  validates :name, presence: true 
  validates :price_cents, numericality: { greater_than: 0 }
  
  after_create_commit :sync_to_stripe

  attr_accessor :stripe_update_type

  def price 
    Money.from_cents(self.price_cents)
  end

  def price=(total:)
    self.price_cents = Money.from_amount(total.to_f, "USD").cents
  end

  def stripe_update_type=(type:)
    self.stripe_update_type = type
  end

  def stripe_update_type 
    stripe_update_type 
  end

  def find_or_create_sale!
    stripe_item_sale || create_stripe_item_sale!(
      total_amt_sold: 0,
      sales_total: 0
    )
  end

  private 

  def sync_to_stripe
    SyncItemToStripeJob.perform_later(self.id)
  end

end
