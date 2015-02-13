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

ActiveRecord::Schema.define(version: 20150212113840) do

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
    t.integer  "topic_id"
    t.string   "nick_name",      null: false
    t.text     "message",        null: false
    t.integer  "parent_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id"

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

end
