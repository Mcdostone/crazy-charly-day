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

ActiveRecord::Schema.define(version: 20150305185403) do

  create_table "commentaires", force: :cascade do |t|
    t.string   "email"
    t.text     "contenu"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "commentaires", ["item_id"], name: "index_commentaires_on_item_id"

  create_table "items", force: :cascade do |t|
    t.string   "nom"
    t.float    "prix"
    t.string   "photo"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "couleur"
    t.integer  "piece_id"
    t.integer  "type_id"
    t.integer  "likes",       default: 0
  end

  add_index "items", ["piece_id"], name: "index_items_on_piece_id"
  add_index "items", ["type_id"], name: "index_items_on_type_id"

  create_table "pieces", force: :cascade do |t|
    t.string   "nom"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "materiau"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "salt"
  end

end
