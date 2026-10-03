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

ActiveRecord::Schema[8.1].define(version: 2026_10_02_211102) do
  create_schema "shenefeltdev_site"

  # These are extensions that must be enabled in order to support this database
  enable_extension "extensions.hypopg"
  enable_extension "extensions.index_advisor"
  enable_extension "extensions.pg_net"
  enable_extension "extensions.pg_stat_statements"
  enable_extension "extensions.pgcrypto"
  enable_extension "extensions.uuid-ossp"
  enable_extension "extensions.wrappers"
  enable_extension "graphql.pg_graphql"
  enable_extension "pg_catalog.pg_cron"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgmq.pgmq"
  enable_extension "vault.supabase_vault"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "stripe_customers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_customers_id"], name: "index_carts_on_stripe_customers_id"
  end

  create_table "refunds", force: :cascade do |t|
    t.bigint "stripe_purchase_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_purchase_id"], name: "index_refunds_on_stripe_purchase_id"
  end

  create_table "stripe_cart_items", force: :cascade do |t|
    t.bigint "stripe_cart_id", null: false
    t.bigint "stripe_item_id", null: false
    t.integer "quantity"
    t.integer "unit_amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_cart_id"], name: "index_stripe_cart_items_on_stripe_cart_id"
    t.index ["stripe_item_id"], name: "index_stripe_cart_items_on_stripe_item_id"
  end

  create_table "stripe_carts", force: :cascade do |t|
    t.bigint "stripe_customer_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_customer_id"], name: "index_stripe_carts_on_stripe_customer_id"
  end

  create_table "stripe_customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "stripe_customer_id"
    t.string "default_payment_method_id"
    t.integer "balance"
    t.boolean "delinquent"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_customer_id"], name: "index_stripe_customers_on_stripe_customer_id", unique: true
  end

  create_table "stripe_item_sales", force: :cascade do |t|
    t.bigint "stripe_item_id", null: false
    t.integer "total_amt_sold"
    t.float "sales_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_item_id"], name: "index_stripe_item_sales_on_stripe_item_id"
  end

  create_table "stripe_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_product_id"
    t.string "stripe_price_id"
  end

  create_table "stripe_purchase_items", force: :cascade do |t|
    t.bigint "stripe_purchases_id", null: false
    t.bigint "stripe_items_id", null: false
    t.integer "quantity"
    t.integer "unit_price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_items_id"], name: "index_stripe_purchase_items_on_stripe_items_id"
    t.index ["stripe_purchases_id"], name: "index_stripe_purchase_items_on_stripe_purchases_id"
  end

  create_table "stripe_purchases", force: :cascade do |t|
    t.bigint "stripe_customers_id", null: false
    t.string "stripe_payment_intent_id"
    t.string "status"
    t.integer "total_cents"
    t.string "currency"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed"
    t.index ["stripe_customers_id"], name: "index_stripe_purchases_on_stripe_customers_id"
  end

  create_table "stripe_refunds", force: :cascade do |t|
    t.bigint "stripe_purchase_id", null: false
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_purchase_id"], name: "index_stripe_refunds_on_stripe_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "first_name"
    t.text "last_name"
    t.text "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carts", "stripe_customers", column: "stripe_customers_id"
  add_foreign_key "refunds", "stripe_purchases"
  add_foreign_key "stripe_cart_items", "stripe_carts"
  add_foreign_key "stripe_cart_items", "stripe_items"
  add_foreign_key "stripe_carts", "stripe_customers"
  add_foreign_key "stripe_item_sales", "stripe_items"
  add_foreign_key "stripe_purchase_items", "stripe_items", column: "stripe_items_id"
  add_foreign_key "stripe_purchase_items", "stripe_purchases", column: "stripe_purchases_id"
  add_foreign_key "stripe_purchases", "stripe_customers", column: "stripe_customers_id"
  add_foreign_key "stripe_refunds", "stripe_purchases", name: "stripe_refunds_stripe_purchase_id_fkey"
end
