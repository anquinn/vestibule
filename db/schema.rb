# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_01_165840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bank_balances", force: :cascade do |t|
    t.integer "balance_cents", default: 0, null: false
    t.bigint "riding_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["riding_id"], name: "index_bank_balances_on_riding_id"
  end

  create_table "email_plans", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "start_date", precision: 6
    t.datetime "end_date", precision: 6
    t.integer "size"
    t.integer "suggested_list_size"
    t.integer "current_subscribes"
    t.bigint "riding_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["riding_id"], name: "index_email_plans_on_riding_id"
  end

  create_table "external_reports", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.string "description_en"
    t.string "description_fr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "riding_external_reports", force: :cascade do |t|
    t.bigint "riding_id", null: false
    t.bigint "external_report_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "link"
    t.index ["external_report_id"], name: "index_riding_external_reports_on_external_report_id"
    t.index ["riding_id"], name: "index_riding_external_reports_on_riding_id"
  end

  create_table "ridings", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.string "riding_code"
    t.string "province_en"
    t.string "province_fr"
    t.string "member_name_en"
    t.string "member_name_fr"
    t.string "member_affiliation_en"
    t.string "member_affiliation_fr"
    t.string "riding_type_en"
    t.string "riding_type_fr"
    t.string "region_en"
    t.string "region_fr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_ridings_on_slug", unique: true
  end

  create_table "tools", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.string "description_en"
    t.string "description_fr"
    t.string "link_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "link_fr"
  end

  create_table "user_permissions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_ridings", force: :cascade do |t|
    t.bigint "riding_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["riding_id"], name: "index_user_ridings_on_riding_id"
    t.index ["user_id"], name: "index_user_ridings_on_user_id"
  end

  create_table "user_user_permissions", force: :cascade do |t|
    t.bigint "user_permission_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_user_permissions_on_user_id"
    t.index ["user_permission_id"], name: "index_user_user_permissions_on_user_permission_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "preferred_language", default: "en"
    t.string "theme", default: "light"
    t.datetime "onboarding_completed_at", precision: 6
    t.integer "user_type", default: 0, null: false
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at", precision: 6
    t.string "unlock_token"
    t.string "title"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bank_balances", "ridings"
  add_foreign_key "email_plans", "ridings"
  add_foreign_key "riding_external_reports", "external_reports"
  add_foreign_key "riding_external_reports", "ridings"
  add_foreign_key "user_ridings", "ridings"
  add_foreign_key "user_ridings", "users"
  add_foreign_key "user_user_permissions", "user_permissions"
  add_foreign_key "user_user_permissions", "users"
end
