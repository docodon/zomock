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

ActiveRecord::Schema.define(version: 20170118053821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id",                                                     null: false
    t.string   "entity_type",                           default: "city",      null: false
    t.integer  "entity_id",                             default: 1,           null: false
    t.text     "title",                                 default: "Delhi NCR", null: false
    t.decimal  "latitude",     precision: 10, scale: 6, default: 28.625789,   null: false
    t.decimal  "longitude",    precision: 10, scale: 6, default: 210276.0,    null: false
    t.integer  "city_id",                               default: 1,           null: false
    t.text     "city_name",                             default: "Delhi NCR", null: false
    t.integer  "country_id",                            default: 1,           null: false
    t.text     "country_name",                          default: "India",     null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "flock_id",   null: false
    t.text     "token",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["flock_id"], name: "index_users_on_flock_id", unique: true, using: :btree

  add_foreign_key "locations", "users"
end
