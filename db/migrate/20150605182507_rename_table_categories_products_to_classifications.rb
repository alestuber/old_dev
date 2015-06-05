class RenameTableCategoriesProductsToClassifications < ActiveRecord::Migration
  def change
    rename_table :categories_products, :classifications
  end
end
