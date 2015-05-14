class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.datetime :deleted_at
      t.string :name

      t.timestamps null: false
    end

    add_index :suppliers, :deleted_at
  end
end
