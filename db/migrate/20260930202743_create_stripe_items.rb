class CreateStripeItems < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_items do |t|
      t.string :name
      t.text :description
      t.integer :price_cents

      t.timestamps
    end
  end
end
