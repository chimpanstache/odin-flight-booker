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

ActiveRecord::Schema[7.0].define(version: 2023_02_19_151816) do
  create_table "airports", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "billings", force: :cascade do |t|
    t.integer "last_4_digits"
    t.integer "cvc"
    t.date "expiration_date"
    t.integer "passenger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passenger_id"], name: "index_billings_on_passenger_id"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "time"
    t.integer "passenger_count"
    t.integer "max_passenger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "departure_id"
    t.integer "arrival_id"
    t.integer "duration_min"
    t.index ["arrival_id"], name: "index_flights_on_arrival_id"
    t.index ["departure_id"], name: "index_flights_on_departure_id"
  end

  create_table "information", force: :cascade do |t|
    t.integer "passenger_id"
    t.integer "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_information_on_flight_id"
    t.index ["passenger_id"], name: "index_information_on_passenger_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "billings", "users", column: "passenger_id"
  add_foreign_key "flights", "airports", column: "arrival_id"
  add_foreign_key "flights", "airports", column: "departure_id"
  add_foreign_key "information", "users", column: "passenger_id"
end
