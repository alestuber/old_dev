class AddMetaFieldsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :permalink, :string
    add_column :categories, :meta_keywords, :string
    add_column :categories, :meta_description, :string
    add_column :categories, :meta_title, :string
  end
end
