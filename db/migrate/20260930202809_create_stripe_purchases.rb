class CreateStripePurchases < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_purchases do |t|
      t.references :stripe_customers, null: false, foreign_key: true
      t.string :stripe_payment_intent_id
      t.string :status
      t.integer :total_cents
      t.string :currency
      t.jsonb :metadata

      t.timestamps
    end
  end
end
