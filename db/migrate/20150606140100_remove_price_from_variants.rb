class RemovePriceFromVariants < ActiveRecord::Migration
  def change
    remove_column :variants, :price, :decimal
  end
end
