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

ActiveRecord::Schema.define(version: 20160319185726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beans", force: :cascade do |t|
    t.string   "name"
    t.string   "region"
    t.string   "taste_profile"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "producer"
    t.integer  "user_id"
  end

  add_index "beans", ["user_id"], name: "index_beans_on_user_id", using: :btree

  create_table "cafes", force: :cascade do |t|
    t.integer  "phone_number"
    t.string   "address"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "cafes", ["user_id"], name: "index_cafes_on_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "region"
    t.string   "roaster"
    t.string   "producer"
    t.string   "method"
    t.string   "taste"
    t.integer  "rating"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "bean_name"
    t.string   "grind"
    t.boolean  "private"
    t.integer  "user_id"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "tastes", force: :cascade do |t|
    t.integer  "sweet"
    t.integer  "fruity"
    t.integer  "chocolate"
    t.integer  "bitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "beans", "users"
  add_foreign_key "cafes", "users"
  add_foreign_key "recipes", "users"
end
