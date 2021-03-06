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

ActiveRecord::Schema.define(version: 20160319133032) do

  create_table "cheers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "grumble_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cheers", ["grumble_id"], name: "index_cheers_on_grumble_id"
  add_index "cheers", ["user_id"], name: "index_cheers_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "grumble_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "anonymous_digest"
  end

  add_index "comments", ["grumble_id"], name: "index_comments_on_grumble_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "grumbles", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "anonymous_digest"
    t.integer  "cheers_count",     default: 0
    t.integer  "sympathies_count", default: 0
    t.integer  "comments_count",   default: 0
  end

  add_index "grumbles", ["user_id"], name: "index_grumbles_on_user_id"

  create_table "sympathies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "grumble_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sympathies", ["grumble_id"], name: "index_sympathies_on_grumble_id"
  add_index "sympathies", ["user_id"], name: "index_sympathies_on_user_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",            default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
