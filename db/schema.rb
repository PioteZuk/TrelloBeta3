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

ActiveRecord::Schema.define(version: 20160721172253) do

  create_table "board_activities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "board_id"
    t.integer  "story_id"
    t.integer  "coment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "board_activities", ["action"], name: "index_board_activities_on_action"
  add_index "board_activities", ["board_id"], name: "index_board_activities_on_board_id"
  add_index "board_activities", ["coment_id"], name: "index_board_activities_on_coment_id"
  add_index "board_activities", ["story_id"], name: "index_board_activities_on_story_id"
  add_index "board_activities", ["user_id"], name: "index_board_activities_on_user_id"

  create_table "boards", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["owner_id"], name: "index_boards_on_owner_id"

  create_table "comments", force: :cascade do |t|
    t.integer "author_id"
    t.integer "story_id"
    t.integer "board_id"
    t.text    "content"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id"
  add_index "comments", ["board_id"], name: "index_comments_on_board_id"
  add_index "comments", ["story_id"], name: "index_comments_on_story_id"

  create_table "invitations", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.boolean  "active",     default: true
    t.boolean  "accepted",   default: false
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["board_id"], name: "index_invitations_on_board_id"
  add_index "invitations", ["email"], name: "index_invitations_on_email"
  add_index "invitations", ["token"], name: "index_invitations_on_token"

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["user_id", "board_id"], name: "index_members_on_user_id_and_board_id", unique: true

  create_table "stories", force: :cascade do |t|
    t.integer "board_id"
    t.integer "executor_id"
    t.text    "description"
    t.string  "title"
    t.string  "type"
  end

  add_index "stories", ["board_id"], name: "index_stories_on_board_id"
  add_index "stories", ["executor_id"], name: "index_stories_on_executor_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
