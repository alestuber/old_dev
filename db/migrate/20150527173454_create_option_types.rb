class CreateOptionTypes < ActiveRecord::Migration
  def change
    create_table :option_types do |t|
      t.string :name
      t.string :presentation
      t.integer :position, default: 0, null: false

      t.timestamps null: false
    end
    add_index :option_types, :position
  end
end
