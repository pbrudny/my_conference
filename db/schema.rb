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

ActiveRecord::Schema.define(version: 20170821131115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donates", force: :cascade do |t|
    t.integer  "amount"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "received"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "token"
    t.string   "my_plan",    default: "want_to_register"
    t.index ["token"], name: "index_donates_on_token", unique: true, using: :btree
  end

  create_table "mailing_users", force: :cascade do |t|
    t.integer  "mailing_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "waiting_user_id"
    t.index ["mailing_id"], name: "index_mailing_users_on_mailing_id", using: :btree
    t.index ["user_id"], name: "index_mailing_users_on_user_id", using: :btree
  end

  create_table "mailings", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "sent_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "body"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "gender"
    t.boolean  "accommodation"
    t.boolean  "pts"
    t.boolean  "jesus_hotel_staff"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "room"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "fellowship"
    t.boolean  "first_time"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "donate_id"
    t.string   "city"
    t.integer  "companions",  default: 0
    t.integer  "category_id"
    t.boolean  "selected"
    t.string   "gender"
    t.string   "days",        default: "both_days"
    t.string   "country"
    t.boolean  "baptized"
  end

  create_table "waiting_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "fellowship"
    t.string   "city"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "gender"
    t.string   "days",        default: "all"
    t.index ["category_id"], name: "index_waiting_users_on_category_id", using: :btree
  end

  add_foreign_key "mailing_users", "mailings"
  add_foreign_key "mailing_users", "users"
  add_foreign_key "waiting_users", "categories"
end
