class CreateJoinTableProductOptionType < ActiveRecord::Migration
  def change
    create_join_table :products, :option_types do |t|
      t.index [:product_id, :option_type_id]
      t.index [:option_type_id, :product_id]
    end
  end
end
