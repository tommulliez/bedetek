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

ActiveRecord::Schema.define(version: 20161115104838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "end_time"
    t.datetime "start_time"
    t.integer  "comic_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comic_id"], name: "index_bookings_on_comic_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "comic_reviews", force: :cascade do |t|
    t.string   "comment"
    t.integer  "comic_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comic_id"], name: "index_comic_reviews_on_comic_id", using: :btree
    t.index ["user_id"], name: "index_comic_reviews_on_user_id", using: :btree
  end

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

  create_table "orders", force: :cascade do |t|
    t.boolean  "payed"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_orders_on_booking_id", using: :btree
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
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "profil_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["profil_id"], name: "index_users_on_profil_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "comics"
  add_foreign_key "bookings", "users"
  add_foreign_key "comic_reviews", "comics"
  add_foreign_key "comic_reviews", "users"
  add_foreign_key "comics", "users"
  add_foreign_key "orders", "bookings"
end
