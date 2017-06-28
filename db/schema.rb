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

ActiveRecord::Schema.define(version: 20170627100208) do

  create_table "bots", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "coordinate_x"
    t.integer  "coordinate_y"
    t.integer  "next_x"
    t.integer  "next_y"
    t.integer  "close_x"
    t.integer  "close_y"
    t.integer  "empty_x"
    t.integer  "empty_y"
    t.integer  "neighbor_x"
    t.integer  "neighbor_y"
  end

  add_index "bots", ["user_id"], name: "index_bots_on_user_id"

  create_table "bots_friend_supports", force: :cascade do |t|
    t.integer  "bot_id"
    t.integer  "friend_support_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "bots_friend_supports", ["bot_id"], name: "index_bots_friend_supports_on_bot_id"
  add_index "bots_friend_supports", ["friend_support_id"], name: "index_bots_friend_supports_on_friend_support_id"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "coordinate_x"
    t.integer  "coordinate_y"
    t.integer  "bot_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "buildings", ["bot_id"], name: "index_buildings_on_bot_id"

  create_table "friend_supports", force: :cascade do |t|
    t.integer  "coordinate_x"
    t.integer  "coordinate_y"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "bot_id"
    t.integer  "tavern_x"
    t.integer  "tavern_y"
  end

  add_index "friend_supports", ["bot_id"], name: "index_friend_supports_on_bot_id"

  create_table "pins", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pins", ["user_id"], name: "index_pins_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
