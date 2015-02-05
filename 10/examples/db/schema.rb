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

ActiveRecord::Schema.define(version: 20150205151009) do

  create_table "services", force: :cascade do |t|
    t.string   "label"
    t.date     "last_visited_at"
    t.integer  "counter",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visits_count"
  end

  add_index "services", ["counter"], name: "index_services_on_counter"

  create_table "visits", force: :cascade do |t|
    t.integer  "service_id"
    t.string   "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
