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

ActiveRecord::Schema.define(version: 2018_11_13_033212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "total_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_bookings_on_teacher_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_skills", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.bigint "skill_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_teacher_skills_on_skill_id"
    t.index ["teacher_id"], name: "index_teacher_skills_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "average_rating"
    t.integer "hourly_price"
    t.date "available_from"
    t.date "available_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "photo"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "teachers"
  add_foreign_key "bookings", "users"
  add_foreign_key "teacher_skills", "skills"
  add_foreign_key "teacher_skills", "teachers"
  add_foreign_key "teachers", "users"
end
