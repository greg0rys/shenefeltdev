class CreateCarts < ActiveRecord::Migration[8.1]
  def change
    create_table :carts do |t|
      t.references :stripe_customers, foreign_key: true, null: true
      t.timestamps
    end
  end
end
