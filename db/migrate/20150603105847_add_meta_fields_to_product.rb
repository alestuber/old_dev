class AddMetaFieldsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :slug, :string
    add_column :products, :meta_title, :string
    add_column :products, :meta_keywords, :string
  end
end
