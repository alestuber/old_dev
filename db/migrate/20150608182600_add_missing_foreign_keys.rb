class AddMissingForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key "option_types_products", "option_types"
    add_foreign_key "option_types_products", "products"
    add_foreign_key "option_values_variants", "option_values"
    add_foreign_key "option_values_variants", "variants"
    add_foreign_key "variants", "products"
    add_foreign_key "categories", "categories", column: "parent_id", name: "categories_parent_id_fk", on_delete: :cascade
  end
end
