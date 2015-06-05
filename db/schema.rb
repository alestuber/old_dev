# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150605202945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "taxonomy_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "permalink"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "meta_title"
  end

  add_index "categories", ["taxonomy_id"], name: "index_categories_on_taxonomy_id", using: :btree

  create_table "classifications", force: :cascade do |t|
    t.integer "product_id",  null: false
    t.integer "category_id", null: false
    t.integer "position"
  end

  add_index "classifications", ["category_id", "product_id"], name: "index_classifications_on_category_id_and_product_id", using: :btree
  add_index "classifications", ["position"], name: "index_classifications_on_position", using: :btree
  add_index "classifications", ["product_id", "category_id"], name: "index_classifications_on_product_id_and_category_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "option_types", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation"
    t.integer  "position",     default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "option_types", ["position"], name: "index_option_types_on_position", using: :btree

  create_table "option_types_products", id: false, force: :cascade do |t|
    t.integer "product_id",     null: false
    t.integer "option_type_id", null: false
  end

  add_index "option_types_products", ["option_type_id", "product_id"], name: "index_option_types_products_on_option_type_id_and_product_id", using: :btree
  add_index "option_types_products", ["product_id", "option_type_id"], name: "index_option_types_products_on_product_id_and_option_type_id", using: :btree

  create_table "option_values", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "option_values", ["option_type_id"], name: "index_option_values_on_option_type_id", using: :btree

  create_table "option_values_variants", id: false, force: :cascade do |t|
    t.integer "variant_id",      null: false
    t.integer "option_value_id", null: false
  end

  add_index "option_values_variants", ["option_value_id", "variant_id"], name: "index_option_values_variants_on_option_value_id_and_variant_id", using: :btree
  add_index "option_values_variants", ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "deleted_at"
    t.integer  "supplier_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "slug"
    t.string   "meta_title"
    t.string   "meta_keywords"
    t.datetime "available_on"
  end

  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
  add_index "products", ["supplier_id"], name: "index_products_on_supplier_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "suppliers", ["deleted_at"], name: "index_suppliers_on_deleted_at", using: :btree

  create_table "taxonomies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "cpf"
    t.datetime "date_of_birth"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["cpf"], name: "index_users_on_cpf", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  create_table "variants", force: :cascade do |t|
    t.string   "sku",                                default: "",    null: false
    t.float    "ean"
    t.decimal  "price",      precision: 8, scale: 2
    t.decimal  "cost_price", precision: 8, scale: 2
    t.boolean  "is_master",                          default: false
    t.integer  "position"
    t.integer  "product_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.text     "images",                                                          array: true
  end

  add_index "variants", ["deleted_at"], name: "index_variants_on_deleted_at", using: :btree

  add_foreign_key "categories", "taxonomies", on_delete: :cascade
  add_foreign_key "option_values", "option_types"
  add_foreign_key "products", "suppliers"
end
