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

ActiveRecord::Schema.define(version: 20200515181202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_participants", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ticket_id"
  end

  add_index "event_participants", ["event_id"], name: "index_event_participants_on_event_id", using: :btree
  add_index "event_participants", ["ticket_id"], name: "index_event_participants_on_ticket_id", using: :btree
  add_index "event_participants", ["user_id"], name: "index_event_participants_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "start_date", null: false
    t.datetime "end_date",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "currency",                           null: false
    t.decimal  "amount",     precision: 8, scale: 2, null: false
    t.integer  "event_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id", using: :btree
  add_index "tickets", ["name"], name: "index_tickets_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                               null: false
    t.string   "name",                                                null: false
    t.string   "encrypted_password",     limit: 128,                  null: false
    t.string   "gender",                             default: "male"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
