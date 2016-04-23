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

ActiveRecord::Schema.define(version: 20160422235424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "museum_id"
    t.integer  "number"
    t.string   "remark"
  end

  add_index "exhibitions", ["museum_id"], name: "index_exhibitions_on_museum_id", using: :btree

  create_table "exhibitions_paintings", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "painting_id"
    t.integer  "exhibition_id"
  end

  add_index "exhibitions_paintings", ["exhibition_id"], name: "index_exhibitions_paintings_on_exhibition_id", using: :btree
  add_index "exhibitions_paintings", ["painting_id"], name: "index_exhibitions_paintings_on_painting_id", using: :btree

  create_table "museums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "city"
    t.string   "remark"
  end

  create_table "paintings", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "has_accurate_date"
    t.integer  "year"
    t.boolean  "circa"
    t.string   "title"
    t.integer  "number"
    t.string   "period"
    t.string   "technique"
    t.string   "cachet"
    t.integer  "museum_id"
    t.string   "localisation"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "carton"
    t.text     "description"
  end

  add_index "paintings", ["museum_id"], name: "index_paintings_on_museum_id", using: :btree

  add_foreign_key "exhibitions", "museums"
  add_foreign_key "exhibitions_paintings", "exhibitions"
  add_foreign_key "exhibitions_paintings", "paintings"
  add_foreign_key "paintings", "museums"
end
