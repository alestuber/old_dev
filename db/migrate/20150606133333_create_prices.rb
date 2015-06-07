class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :value
      t.references :priceable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
