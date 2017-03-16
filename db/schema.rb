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

ActiveRecord::Schema.define(version: 20170313150443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prestation_orders", force: :cascade do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "entreprise"
    t.string   "email"
    t.string   "tel"
    t.text     "place"
    t.text     "availabilities"
    t.string   "typeofproduct"
    t.text     "product"
    t.time     "length"
    t.string   "interview"
    t.string   "month"
    t.integer  "day"
    t.text     "other"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "products_sizes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_sizes_on_product_id", using: :btree
    t.index ["size_id"], name: "index_products_sizes_on_size_id", using: :btree
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
