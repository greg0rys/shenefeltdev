class CreateStripePurchaseItems < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_purchase_items do |t|
      t.references :stripe_purchases, null: false, foreign_key: true
      t.references :stripe_items, null: false, foreign_key: true
      t.integer :quantity
      t.integer :unit_price_cents

      t.timestamps
    end
  end
end
