class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :products, :deleted_at
  end
end
