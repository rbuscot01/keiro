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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_162325) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catreqs", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_catreqs_on_category_id"
    t.index ["request_id"], name: "index_catreqs_on_request_id"
  end

  create_table "hotcats", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "hotspot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_hotcats_on_category_id"
    t.index ["hotspot_id"], name: "index_hotcats_on_hotspot_id"
  end

  create_table "hotitis", force: :cascade do |t|
    t.bigint "hotspot_id", null: false
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotspot_id"], name: "index_hotitis_on_hotspot_id"
    t.index ["itinerary_id"], name: "index_hotitis_on_itinerary_id"
  end

  create_table "hotspots", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "hotspot_picture"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer "duration"
    t.float "length"
    t.float "elevation"
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id", null: false
    t.index ["request_id"], name: "index_itineraries_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "distance"
    t.float "longitude"
    t.float "latitude"
    t.string "constant_categories"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category", array: true
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "catreqs", "categories"
  add_foreign_key "catreqs", "requests"
  add_foreign_key "hotcats", "categories"
  add_foreign_key "hotcats", "hotspots"
  add_foreign_key "hotitis", "hotspots"
  add_foreign_key "hotitis", "itineraries"
  add_foreign_key "itineraries", "requests"
  add_foreign_key "requests", "users"
end
