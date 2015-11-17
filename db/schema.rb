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

ActiveRecord::Schema.define(version: 20151117060353) do

  create_table "answers", force: :cascade do |t|
    t.integer  "test_question_id", limit: 4
    t.text     "ans_text",         limit: 65535
    t.boolean  "proper"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "addr",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
    t.string   "chiefname",  limit: 255
    t.string   "chiefpost",  limit: 255
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content",              limit: 65535
    t.integer  "user_id",              limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "test_questions", force: :cascade do |t|
    t.integer  "test_id",    limit: 4
    t.text     "question",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "testing_intermediate_results", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "test_id",          limit: 4
    t.integer  "test_question_id", limit: 4
    t.integer  "answer_id",        limit: 4
    t.boolean  "proper"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "comment",          limit: 255
  end

  add_index "testing_intermediate_results", ["answer_id"], name: "index_testing_intermediate_results_on_answer_id", using: :btree
  add_index "testing_intermediate_results", ["test_id"], name: "index_testing_intermediate_results_on_test_id", using: :btree
  add_index "testing_intermediate_results", ["test_question_id"], name: "index_testing_intermediate_results_on_test_question_id", using: :btree
  add_index "testing_intermediate_results", ["user_id"], name: "index_testing_intermediate_results_on_user_id", using: :btree

  create_table "testing_results", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4
    t.integer  "test_id",                 limit: 4
    t.integer  "test_question_id",        limit: 4
    t.integer  "answer_id",               limit: 4
    t.boolean  "proper"
    t.integer  "attempt",                 limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "testing_stat_attempt_id", limit: 4
  end

  create_table "testing_stat_attempts", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "test_id",           limit: 4
    t.integer  "attempt",           limit: 4
    t.datetime "tmbegin"
    t.datetime "tmend"
    t.integer  "duration",          limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "numquestion",       limit: 4
    t.integer  "numcorrectanswers", limit: 4
    t.string   "assessment",        limit: 255
    t.string   "comment",           limit: 255
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4,   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "family",            limit: 255
    t.string   "otchestvo",         limit: 255
    t.string   "email",             limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.boolean  "admin",                         default: false
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",                     default: false
    t.datetime "activated_at"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.boolean  "pdexeconfirm"
    t.string   "type",              limit: 255
    t.integer  "company_id",        limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "microposts", "users"
end
