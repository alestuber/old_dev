class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :parent
      t.integer :lft
      t.integer :rgt

      t.timestamps null: false
    end
  end
end
