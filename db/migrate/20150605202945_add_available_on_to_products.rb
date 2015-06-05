class AddAvailableOnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :available_on, :datetime
  end
end
