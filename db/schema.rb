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

ActiveRecord::Schema.define(version: 20150217010301) do

  create_table "fraternities", force: true do |t|
    t.string   "name",       null: false
    t.string   "letters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fraternity_chapters", force: true do |t|
    t.integer  "university_id"
    t.integer  "fraternity_id"
    t.string   "chapter_name",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fraternity_chapters", ["fraternity_id"], name: "index_fraternity_chapters_on_fraternity_id"
  add_index "fraternity_chapters", ["university_id"], name: "index_fraternity_chapters_on_university_id"

  create_table "posts", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "nick_name",        null: false
    t.text     "message",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["commentable_id", "commentable_type"], name: "index_posts_on_commentable_id_and_commentable_type"

  create_table "ratings", force: true do |t|
    t.string   "nick_name",    null: false
    t.string   "message",      null: false
    t.float    "looks",        null: false
    t.float    "popularity",   null: false
    t.float    "classiness",   null: false
    t.float    "involvement",  null: false
    t.float    "socialness",   null: false
    t.float    "brotherhood",  null: false
    t.integer  "chapter_id",   null: false
    t.string   "chapter_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sororities", force: true do |t|
    t.string   "name",       null: false
    t.string   "letters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sorority_chapters", force: true do |t|
    t.integer  "university_id"
    t.integer  "sorority_id"
    t.string   "chapter_name",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sorority_chapters", ["sorority_id"], name: "index_sorority_chapters_on_sorority_id"
  add_index "sorority_chapters", ["university_id"], name: "index_sorority_chapters_on_university_id"

  create_table "topics", force: true do |t|
    t.integer  "university_id"
    t.string   "subject",       null: false
    t.string   "nick_name",     null: false
    t.text     "message",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["university_id"], name: "index_topics_on_university_id"

  create_table "universities", force: true do |t|
    t.string   "name",       null: false
    t.string   "initials",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
