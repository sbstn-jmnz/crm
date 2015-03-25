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

ActiveRecord::Schema.define(version: 20150325185401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "user"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "applicants", force: :cascade do |t|
    t.string   "name"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "condition_id"
  end

  add_index "applicants", ["email"], name: "index_applicants_on_email", unique: true, using: :btree
  add_index "applicants", ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true, using: :btree

  create_table "conditions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type"
  end

  create_table "languages", force: :cascade do |t|
    t.integer  "postulation_detail_id"
    t.string   "name"
    t.string   "written_level"
    t.string   "spoken_level"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "languages", ["postulation_detail_id"], name: "index_languages_on_postulation_detail_id", using: :btree

  create_table "postulation_details", force: :cascade do |t|
    t.integer  "postulation_id"
    t.text     "motivation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "postulation_details", ["postulation_id"], name: "index_postulation_details_on_postulation_id", using: :btree

  create_table "postulations", force: :cascade do |t|
    t.integer  "admin_user_id"
    t.integer  "applicant_id"
    t.integer  "version_id"
    t.integer  "condition_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "postulations", ["admin_user_id"], name: "index_postulations_on_admin_user_id", using: :btree
  add_index "postulations", ["applicant_id"], name: "index_postulations_on_applicant_id", using: :btree
  add_index "postulations", ["condition_id"], name: "index_postulations_on_condition_id", using: :btree
  add_index "postulations", ["version_id"], name: "index_postulations_on_version_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "applicant_id"
    t.integer  "admin_user_id"
    t.string   "title"
    t.boolean  "is_done"
    t.date     "due_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "versions", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "supply"
    t.datetime "starting_date"
    t.datetime "ending_date"
    t.integer  "condition_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "versions", ["condition_id"], name: "index_versions_on_condition_id", using: :btree

  add_foreign_key "applicants", "conditions"
  add_foreign_key "languages", "postulation_details"
  add_foreign_key "postulation_details", "postulations"
  add_foreign_key "postulations", "admin_users"
  add_foreign_key "postulations", "applicants"
  add_foreign_key "postulations", "conditions"
  add_foreign_key "postulations", "versions"
  add_foreign_key "versions", "conditions"
end
