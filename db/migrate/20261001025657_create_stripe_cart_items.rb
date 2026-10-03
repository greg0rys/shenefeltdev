class CreateStripeCartItems < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_cart_items do |t|
      t.references :stripe_cart, null: false, foreign_key: true
      t.references :stripe_item, null: false, foreign_key: true
      t.integer :quantity
      t.integer :unit_amount_cents

      t.timestamps
    end
  end
end
