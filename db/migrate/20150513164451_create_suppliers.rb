class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :suppliers, :deleted_at
  end
end
