class CreateTaxonomiesAndCategories < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :name, null: false
      t.timestamps null: false
      t.integer :position
    end

    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :taxonomy, index: true
      t.references :parent
      t.integer :lft
      t.integer :rgt
      t.timestamps null: false
    end

    add_foreign_key :categories, :taxonomies, on_delete: :cascade
  end
end
