class CreateStripeItemSales < ActiveRecord::Migration[8.1]
  def change
    create_table :stripe_item_sales do |t|
      t.references :stripe_item, null: false, foreign_key: true
      t.integer :total_amt_sold
      t.float :sales_total

      t.timestamps
    end
  end
end
