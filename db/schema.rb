# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_04_083155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stage_id", null: false
    t.string "status"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_applications_on_stage_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "requester_id", null: false
    t.bigint "requested_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requested_id"], name: "index_chatrooms_on_requested_id"
    t.index ["requester_id"], name: "index_chatrooms_on_requester_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "location"
    t.text "bio"
    t.string "avatar"
    t.text "past_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "reviewer_id", null: false
    t.bigint "reviewed_id", null: false
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewed_id"], name: "index_reviews_on_reviewed_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "stages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "restaurant_name"
    t.string "title"
    t.text "description"
    t.datetime "datetime"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_type"
    t.float "rating"
    t.integer "reviews_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "stages"
  add_foreign_key "applications", "users"
  add_foreign_key "chatrooms", "users", column: "requested_id"
  add_foreign_key "chatrooms", "users", column: "requester_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "users", column: "reviewed_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "stages", "users"
end
