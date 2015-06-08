class AddMissingForeignKeyToCategory < ActiveRecord::Migration
  def change
    add_foreign_key "categories", "categories", column: "parent_id", name: "categories_parent_id_fk", on_delete: :cascade
  end
end
