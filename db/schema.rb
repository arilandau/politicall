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

ActiveRecord::Schema.define(version: 20170322175722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "congresslists", force: :cascade do |t|
    t.integer "list_id"
    t.integer "congressmember_id"
    t.index ["congressmember_id"], name: "index_congresslists_on_congressmember_id", using: :btree
    t.index ["list_id"], name: "index_congresslists_on_list_id", using: :btree
  end

  create_table "congressmembers", force: :cascade do |t|
    t.string  "full_name",        null: false
    t.string  "party",            null: false
    t.string  "chamber",          null: false
    t.string  "leadership_role"
    t.string  "twitter_account"
    t.string  "facebook_account"
    t.string  "email"
    t.string  "url"
    t.string  "senority"
    t.integer "next_election",    null: false
    t.string  "phone"
    t.string  "state",            null: false
    t.string  "photo"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                null: false
    t.string   "last_name",                                 null: false
    t.string   "username",                                  null: false
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "role",                   default: "member"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
