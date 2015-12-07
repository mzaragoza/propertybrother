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

ActiveRecord::Schema.define(version: 20151207001344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_payments", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "payment_type"
    t.datetime "payment_date"
    t.decimal  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "subdomain",             default: "", null: false
    t.string   "name",                  default: "", null: false
    t.string   "address",               default: "", null: false
    t.string   "city",                  default: "", null: false
    t.string   "state",                 default: "", null: false
    t.string   "zip",                   default: "", null: false
    t.integer  "number_of_appartments"
    t.decimal  "monthly_fee"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "username",               default: "",   null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "first_name",             default: "",   null: false
    t.string   "last_name",              default: "",   null: false
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "office_phone"
    t.string   "extension"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "title"
    t.boolean  "active",                 default: true, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "created_by_id",          default: 0,    null: false
    t.string   "created_by_type",        default: "",   null: false
    t.integer  "deleted_by_id"
    t.string   "deleted_by_type"
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "managers", ["confirmation_token"], name: "index_managers_on_confirmation_token", unique: true, using: :btree
  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree
  add_index "managers", ["unlock_token"], name: "index_managers_on_unlock_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
