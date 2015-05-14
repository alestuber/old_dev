class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :sku,                          :default => '',    :null => false
      t.float :ean,
      t.decimal :price,         :precision => 8, :scale => 2,    :null => false
      t.boolean :is_master,                                   :default => false
      t.decimal :cost_price,    :precision => 8, :scale => 2,    :null => false
      t.references :supplier, index: true, foreign_key: true
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :variants, :deleted_at
  end
end
