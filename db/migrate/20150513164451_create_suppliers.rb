class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.datetime :deleted_at
      add_index  :deleted_at

      t.timestamps null: false
    end
  end
end
