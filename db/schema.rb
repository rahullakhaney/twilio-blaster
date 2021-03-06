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

ActiveRecord::Schema.define(version: 20160108030813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "opt_in"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "contacts_messages", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "message_id"
  end

  add_index "contacts_messages", ["contact_id"], name: "index_contacts_messages_on_contact_id", using: :btree
  add_index "contacts_messages", ["message_id"], name: "index_contacts_messages_on_message_id", using: :btree

  create_table "group_memberships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "contact_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_memberships", ["contact_id"], name: "index_group_memberships_on_contact_id", using: :btree
  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "group_type"
  end

  create_table "groups_messages", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "message_id"
  end

  add_index "groups_messages", ["group_id"], name: "index_groups_messages_on_group_id", using: :btree
  add_index "groups_messages", ["message_id"], name: "index_groups_messages_on_message_id", using: :btree

  create_table "message_logs", force: :cascade do |t|
    t.string   "to_phone_number"
    t.string   "from_phone_number"
    t.string   "status"
    t.string   "sid"
    t.string   "error_code"
    t.string   "error_message"
    t.datetime "date_sent"
    t.string   "account_sid"
    t.string   "billing_reference"
    t.integer  "message_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "message_type"
  end

  add_index "message_logs", ["message_id"], name: "index_message_logs_on_message_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.string   "to_phone_number"
    t.string   "from_phone_number"
    t.string   "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "media_url"
    t.string   "direction"
    t.string   "message_type"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "contacts", "users"
  add_foreign_key "message_logs", "messages"
end
