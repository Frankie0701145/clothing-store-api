# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_20_113022) do

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_name"], name: "index_products_on_product_name"
  end

  create_table "sub_type_options", force: :cascade do |t|
    t.string "option"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "value"
    t.index ["name"], name: "index_sub_types_on_name"
  end

  create_table "sub_types_types", id: false, force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "sub_type_id", null: false
    t.index "\"sub_types_id\"", name: "index_sub_types_types_on_sub_types_id"
    t.index "\"types_id\"", name: "index_sub_types_types_on_types_id"
  end

  create_table "types", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_types_on_product_id"
  end

  add_foreign_key "types", "products"
end
