class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.integer :quantity
      t.integer :group_quantity
      t.string :group_identifier
      t.string :identifier
      t.decimal :cost, precision: 12, scale: 2

      t.timestamps null: false
    end
  end
end
