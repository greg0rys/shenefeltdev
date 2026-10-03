class AddCompletedToStripePurchase < ActiveRecord::Migration[8.1]
  def change
    add_column :stripe_purchases, :completed, :boolean
  end
end
