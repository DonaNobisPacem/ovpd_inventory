class CreateTransactionItems < ActiveRecord::Migration
  def change
    create_table :transaction_items do |t|
      t.references :supply_transaction, index: true, foreign_key: true
      t.integer :quantity
      t.integer :product_id
      t.integer :transaction_type

      t.timestamps null: false
    end
  end
end
