class CreateRefunds < ActiveRecord::Migration[8.1]
  def change
    create_table :refunds do |t|
      t.references :stripe_purchase, null: false, foreign_key: true
      t.integer :amount, null: true

      t.timestamps
    end
  end
end
