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

ActiveRecord::Schema[7.0].define(version: 2023_04_15_200748) do
  create_table "airports", force: :cascade do |t|
    t.integer "country_id"
    t.string "city"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.index ["country_id"], name: "index_airports_on_country_id"
  end

  create_table "billing", force: :cascade do |t|
    t.integer "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "passenger_id"
    t.index ["flight_id"], name: "index_billing_on_flight_id"
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

  create_table "bookings", force: :cascade do |t|
    t.date "expiration_date"
    t.integer "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso2"
    t.string "iso3"
    t.integer "numcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "passenger_id", null: false
    t.integer "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "informations", force: :cascade do |t|
    t.integer "passenger_id"
    t.integer "booking_id"
    t.index ["booking_id"], name: "index_informations_on_booking_id"
    t.index ["passenger_id"], name: "index_informations_on_passenger_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "airports", "countries"
  add_foreign_key "billings", "users", column: "passenger_id"
  add_foreign_key "flights", "airports", column: "arrival_id"
  add_foreign_key "flights", "airports", column: "departure_id"
  add_foreign_key "informations", "bookings"
  add_foreign_key "informations", "users", column: "passenger_id"
end
