class CreateStripeCarts < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_carts do |t|
      t.references :stripe_customer, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
