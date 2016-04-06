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

ActiveRecord::Schema.define(version: 20160404201754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounting_classifications", force: :cascade do |t|
    t.string   "account"
    t.string   "name"
    t.string   "ifrs_value"
    t.string   "local_value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "af_assets", force: :cascade do |t|
    t.integer  "asset_name_id"
    t.integer  "quantity",                     default: 1
    t.string   "serial",                       default: "NA"
    t.string   "model",                        default: "NA"
    t.string   "reference",                    default: "NA"
    t.string   "tech_plaque",                  default: "NA"
    t.string   "old_plaque"
    t.string   "current_plaque"
    t.text     "characteristics",              default: "NA"
    t.text     "comments",                     default: "NA"
    t.decimal  "purchase_value"
    t.date     "purchase_date"
    t.integer  "age"
    t.decimal  "factor_m"
    t.decimal  "factor_r"
    t.string   "vuef"
    t.decimal  "reposition_price"
    t.string   "accounting_crossing"
    t.boolean  "is_parent",                    default: true
    t.integer  "accounting_classification_id"
    t.integer  "custodian_id"
    t.integer  "internal_location_id"
    t.integer  "subsidiary_id"
    t.integer  "user_id"
    t.integer  "root_category_id"
    t.integer  "af_asset_id"
    t.boolean  "is_verifiqued"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "city_id"
    t.integer  "brand_id"
  end

  add_index "af_assets", ["accounting_classification_id"], name: "index_af_assets_on_accounting_classification_id", using: :btree
  add_index "af_assets", ["af_asset_id"], name: "index_af_assets_on_af_asset_id", using: :btree
  add_index "af_assets", ["asset_name_id"], name: "index_af_assets_on_asset_name_id", using: :btree
  add_index "af_assets", ["brand_id"], name: "index_af_assets_on_brand_id", using: :btree
  add_index "af_assets", ["city_id"], name: "index_af_assets_on_city_id", using: :btree
  add_index "af_assets", ["custodian_id"], name: "index_af_assets_on_custodian_id", using: :btree
  add_index "af_assets", ["internal_location_id"], name: "index_af_assets_on_internal_location_id", using: :btree
  add_index "af_assets", ["root_category_id"], name: "index_af_assets_on_root_category_id", using: :btree
  add_index "af_assets", ["subsidiary_id"], name: "index_af_assets_on_subsidiary_id", using: :btree
  add_index "af_assets", ["user_id"], name: "index_af_assets_on_user_id", using: :btree

  create_table "asset_names", force: :cascade do |t|
    t.string   "name"
    t.string   "height"
    t.string   "width"
    t.string   "depth"
    t.text     "joined"
    t.text     "source"
    t.decimal  "purchase_price"
    t.integer  "brand_id"
    t.integer  "useful_life"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "accounting_classification_id"
  end

  add_index "asset_names", ["accounting_classification_id"], name: "index_asset_names_on_accounting_classification_id", using: :btree
  add_index "asset_names", ["brand_id"], name: "index_asset_names_on_brand_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custodians", force: :cascade do |t|
    t.string   "full_name"
    t.string   "office_work"
    t.string   "identification"
    t.text     "phones"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "internal_locations", force: :cascade do |t|
    t.string   "name"
    t.boolean  "activated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "af_asset_id"
  end

  add_index "photos", ["af_asset_id"], name: "index_photos_on_af_asset_id", using: :btree

  create_table "root_categories", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.text     "address"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subsidiaries", ["city_id"], name: "index_subsidiaries_on_city_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "nit"
    t.string   "phone"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text     "full_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "af_assets", "accounting_classifications"
  add_foreign_key "af_assets", "af_assets"
  add_foreign_key "af_assets", "asset_names"
  add_foreign_key "af_assets", "brands"
  add_foreign_key "af_assets", "cities"
  add_foreign_key "af_assets", "custodians"
  add_foreign_key "af_assets", "internal_locations"
  add_foreign_key "af_assets", "root_categories"
  add_foreign_key "af_assets", "subsidiaries"
  add_foreign_key "af_assets", "users"
  add_foreign_key "asset_names", "accounting_classifications"
  add_foreign_key "asset_names", "brands"
  add_foreign_key "photos", "af_assets"
  add_foreign_key "subsidiaries", "cities"
end
