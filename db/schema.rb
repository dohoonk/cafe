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

ActiveRecord::Schema.define(version: 20160404004711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bean_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bean_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bean_likes", ["bean_id"], name: "index_bean_likes_on_bean_id", using: :btree
  add_index "bean_likes", ["user_id"], name: "index_bean_likes_on_user_id", using: :btree

  create_table "beans", force: :cascade do |t|
    t.string   "name"
    t.string   "region"
    t.string   "taste_profile"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "producer"
    t.integer  "user_id"
    t.string   "beanimg"
    t.string   "slug"
    t.string   "roast"
  end

  add_index "beans", ["slug"], name: "index_beans_on_slug", using: :btree
  add_index "beans", ["user_id"], name: "index_beans_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "recipe_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_likes", ["recipe_id"], name: "index_recipe_likes_on_recipe_id", using: :btree
  add_index "recipe_likes", ["user_id"], name: "index_recipe_likes_on_user_id", using: :btree

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
    t.string   "recipeimg"
    t.string   "slug"
    t.integer  "sweet"
    t.integer  "fruity"
    t.integer  "bitter"
    t.integer  "chocolate"
  end

  add_index "recipes", ["slug"], name: "index_recipes_on_slug", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "shop_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shop_likes", ["shop_id"], name: "index_shop_likes_on_shop_id", using: :btree
  add_index "shop_likes", ["user_id"], name: "index_shop_likes_on_user_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.integer  "phone_number"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "cafeimg"
    t.string   "slug"
  end

  add_index "shops", ["slug"], name: "index_shops_on_slug", using: :btree
  add_index "shops", ["user_id"], name: "index_shops_on_user_id", using: :btree

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
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "twitter_consumer_token"
    t.string   "twitter_consumer_secret"
    t.string   "twitter_raw_data"
    t.string   "avatar"
    t.string   "slug"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", using: :btree

  add_foreign_key "bean_likes", "beans"
  add_foreign_key "bean_likes", "users"
  add_foreign_key "beans", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "recipe_likes", "recipes"
  add_foreign_key "recipe_likes", "users"
  add_foreign_key "recipes", "users"
  add_foreign_key "shop_likes", "shops"
  add_foreign_key "shop_likes", "users"
  add_foreign_key "shops", "users"
end
