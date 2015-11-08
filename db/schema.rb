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

ActiveRecord::Schema.define(version: 20140821012104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "youtube_url"
    t.string   "proper_form_text"
    t.string   "mini_image_url"
    t.integer  "workout_id"
    t.integer  "muscle_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reps"
    t.integer  "sets"
    t.integer  "weight"
    t.integer  "time"
    t.boolean  "is_run"
  end

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "how_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "initial_tests", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pushups"
    t.integer  "situps"
    t.integer  "bodyweight_squats"
    t.time     "mile_run_time"
    t.integer  "resting_heart_rate"
    t.string   "status"
    t.integer  "user_id"
  end

  add_index "initial_tests", ["user_id"], name: "index_initial_tests_on_user_id", using: :btree

  create_table "muscle_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_details", force: :cascade do |t|
    t.string   "gender"
    t.integer  "weight"
    t.integer  "neck"
    t.integer  "shoulders"
    t.integer  "chest"
    t.integer  "bicep"
    t.integer  "waist"
    t.integer  "hips"
    t.integer  "thigh"
    t.integer  "resting_heart_rate"
    t.integer  "calf"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zip"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "activity_level"
    t.integer  "age"
    t.string   "test_status"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "muscle_group_id"
    t.integer  "user_id"
  end

end
