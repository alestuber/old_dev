class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :sku
      t.decimal :price
      t.decimal :weigh
      t.decimal :height
      t.decimal :width
      t.decimal :depth
      t.datetime :deleted_at
      t.boolean :is_master
      t.integer :product_id
      t.decimal :cost_price

      t.timestamps null: false
    end
  end
end
