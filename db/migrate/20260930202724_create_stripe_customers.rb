class CreateStripeCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :stripe_customer_id
      t.string :default_payment_method_id
      t.integer :balance
      t.boolean :delinquent
      t.jsonb :metadata

      t.timestamps
    end
    add_index :stripe_customers, :stripe_customer_id, unique: true
  end
end
