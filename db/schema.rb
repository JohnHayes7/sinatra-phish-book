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

ActiveRecord::Schema.define(version: 20190618183746) do

  create_table "fans", force: :cascade do |t|
    t.string  "username"
    t.string  "email"
    t.string  "password_digest"
    t.integer "memory_id"
  end

  create_table "fans_shows", id: false, force: :cascade do |t|
    t.integer "show_id", null: false
    t.integer "fan_id",  null: false
  end

  add_index "fans_shows", ["fan_id"], name: "index_fans_shows_on_fan_id"
  add_index "fans_shows", ["show_id"], name: "index_fans_shows_on_show_id"

  create_table "memories", force: :cascade do |t|
    t.integer "fan_id"
    t.integer "show_id"
    t.string  "content"
  end

  create_table "shows", force: :cascade do |t|
    t.string  "date"
    t.string  "location"
    t.string  "setlist"
    t.integer "year_id"
    t.string  "venue"
    t.integer "memory_id"
  end

  create_table "years", force: :cascade do |t|
    t.integer "value"
  end

end
