class CreateProductInfrastructure < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category

      t.timestamps null: false
    end

    create_table :variants do |t|
      t.string     :sku,                      :default => '',    :null => false
      t.float      :ean
      t.decimal    :cost_price,                    :precision => 8, :scale => 2
      t.boolean    :is_master,                                :default => false
      t.integer    :position
      t.references :product

      t.timestamps null: false
    end
  end
end
