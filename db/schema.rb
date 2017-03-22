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

ActiveRecord::Schema.define(version: 20170321192327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "createdat"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "mediatype_id"
    t.integer  "categories_id"
    t.index ["categories_id"], name: "index_media_on_categories_id", using: :btree
    t.index ["mediatype_id"], name: "index_media_on_mediatype_id", using: :btree
    t.index ["url"], name: "index_media_on_url", using: :btree
  end

  create_table "mediatypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  add_foreign_key "media", "categories", column: "categories_id"
  add_foreign_key "media", "mediatypes"
end
