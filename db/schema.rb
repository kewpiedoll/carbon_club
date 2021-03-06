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

ActiveRecord::Schema.define(version: 20140601201653) do

  create_table "energy_systems", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "producer_id"
    t.integer  "CO2_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "producers", force: true do |t|
    t.string   "user_name"
    t.string   "full_name"
    t.integer  "re_system_type"
    t.integer  "init_kwh_reading"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.boolean  "approved",               default: false, null: false
  end

  add_index "producers", ["approved"], name: "index_producers_on_approved"
  add_index "producers", ["confirmation_token"], name: "index_producers_on_confirmation_token", unique: true
  add_index "producers", ["reset_password_token"], name: "index_producers_on_reset_password_token", unique: true

  create_table "registrations", force: true do |t|
    t.integer  "producer_id"
    t.integer  "energy_system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
