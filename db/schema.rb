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

ActiveRecord::Schema.define(version: 20161114143946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comics", force: :cascade do |t|
    t.string   "title"
    t.string   "editor"
    t.string   "artist"
    t.string   "year"
    t.integer  "price"
    t.string   "photo"
    t.string   "genre"
    t.string   "description"
    t.string   "tags"
    t.string   "state"
    t.boolean  "availability"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_comics_on_user_id", using: :btree
  end

  create_table "profils", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "avatar"
    t.string   "city"
    t.string   "country"
    t.string   "preferences"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "password"
    t.string   "email"
    t.integer  "profil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profil_id"], name: "index_users_on_profil_id", using: :btree
  end

  add_foreign_key "comics", "users"
  add_foreign_key "users", "profils"
end
