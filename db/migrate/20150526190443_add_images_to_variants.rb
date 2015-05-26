class AddImagesToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :images, :text, array: true
  end
end
