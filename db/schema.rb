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

ActiveRecord::Schema.define(version: 2021_08_23_035812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tab_id"
    t.string "status"
    t.decimal "subtotal", precision: 10, scale: 2
    t.decimal "tax", precision: 10, scale: 2
    t.decimal "total", precision: 10, scale: 2
    t.decimal "tip", precision: 10, scale: 2
    t.decimal "adjusted_total", precision: 10, scale: 2
    t.string "payment_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kitchen_todos", force: :cascade do |t|
    t.integer "tab_id"
    t.integer "product_id"
    t.string "submitted_time"
    t.string "product_item_name"
    t.string "dining_option"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ordered_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity"
    t.integer "user_id"
    t.string "status"
    t.integer "tab_id"
    t.string "dining_option"
    t.integer "check_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_item_name"
    t.string "product_menu_category"
    t.decimal "product_price", precision: 10, scale: 2
    t.decimal "subtotal", precision: 10, scale: 2
    t.string "customer_note"
    t.string "tab_name"
  end

  create_table "products", force: :cascade do |t|
    t.string "item_name"
    t.string "menu_category"
    t.decimal "price", precision: 10, scale: 2
    t.boolean "availability"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "tabs", force: :cascade do |t|
    t.string "tab_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
