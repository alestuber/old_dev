class CreateProductInfrastructure < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :suppliers, :deleted_at

    create_table :products do |t|
      t.string :name
      t.text :description
      t.datetime :deleted_at
      t.references :supplier,                    index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :products, :deleted_at

    create_table :variants do |t|
      t.string     :name
      t.string     :sku,                      :default => '',    :null => false
      t.float      :ean
      t.decimal    :price,                         :precision => 8, :scale => 2
      t.decimal    :cost_price,                    :precision => 8, :scale => 2
      t.boolean    :is_master,                                :default => false
      t.integer    :position
      t.references :product
      t.datetime   :deleted_at
      t.timestamps null: false
    end
    add_index :variants, :deleted_at
  end
end
