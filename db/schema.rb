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

ActiveRecord::Schema.define(version: 20151112095658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "date"
    t.text     "user_comment"
    t.text     "restaurant_comment"
    t.boolean  "viewed_by_place"
    t.boolean  "viewed_by_user"
    t.string   "status"
    t.integer  "number_of_people"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "bookings", ["restaurant_id"], name: "index_bookings_on_restaurant_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "website_url"
    t.string   "facebook_page"
    t.string   "twitter_handle"
    t.text     "opening_days_hours"
    t.text     "description"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "category"
    t.string   "cover_picture_file_name"
    t.string   "cover_picture_content_type"
    t.integer  "cover_picture_file_size"
    t.datetime "cover_picture_updated_at"
    t.string   "menu_picture_file_name"
    t.string   "menu_picture_content_type"
    t.integer  "menu_picture_file_size"
    t.datetime "menu_picture_updated_at"
    t.string   "item_picture_file_name"
    t.string   "item_picture_content_type"
    t.integer  "item_picture_file_size"
    t.datetime "item_picture_updated_at"
  end

  add_index "restaurants", ["confirmation_token"], name: "index_restaurants_on_confirmation_token", unique: true, using: :btree
  add_index "restaurants", ["email"], name: "index_restaurants_on_email", unique: true, using: :btree
  add_index "restaurants", ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "content"
    t.text     "reply"
    t.boolean  "viewed_by_place",     default: false
    t.boolean  "reply_viewd_by_user", default: false
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "restaurants"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
