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

ActiveRecord::Schema.define(version: 20131216213850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "google_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "canvases", force: true do |t|
    t.integer  "artists_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "circles", force: true do |t|
    t.float    "x"
    t.float    "y"
    t.float    "radius"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layers", force: true do |t|
    t.string   "fill"
    t.string   "stroke"
    t.string   "opacity"
    t.integer  "canvas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paths", force: true do |t|
    t.text     "pathString"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rectangles", force: true do |t|
    t.float    "x"
    t.float    "y"
    t.float    "width"
    t.float    "height"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spyros", force: true do |t|
    t.text     "path"
    t.string   "fill"
    t.string   "stroke"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spyros", ["layer_id"], name: "index_spyros_on_layer_id", using: :btree

end
