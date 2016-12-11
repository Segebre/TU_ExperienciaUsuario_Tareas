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

ActiveRecord::Schema.define(version: 20161211104142) do

  create_table "characters", force: true do |t|
    t.text     "name"
    t.text     "role"
    t.integer  "membership_id"
    t.text     "email"
    t.text     "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["membership_id"], name: "index_characters_on_membership_id"

  create_table "comments", force: true do |t|
    t.text     "message"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  add_index "comments", ["character_id"], name: "index_comments_on_character_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "memberships", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "message"
    t.datetime "scheduled_at"
    t.text     "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  add_index "posts", ["character_id"], name: "index_posts_on_character_id"

  create_table "users", force: true do |t|
    t.text     "password_digest"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
