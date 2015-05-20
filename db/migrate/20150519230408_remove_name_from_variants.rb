class RemoveNameFromVariants < ActiveRecord::Migration
  def change
    remove_column :variants, :name, :string
  end
end
