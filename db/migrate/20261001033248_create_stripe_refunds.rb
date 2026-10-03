class CreateStripeRefunds < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_refunds do |t|
      t.references :stripe_purchase, null: false, foreign_key: true
      t.integer :amount_cents

      t.timestamps
    end
  end
end
