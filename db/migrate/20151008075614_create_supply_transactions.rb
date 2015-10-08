class CreateSupplyTransactions < ActiveRecord::Migration
  def change
    create_table :supply_transactions do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
