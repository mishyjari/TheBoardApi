# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_05_161330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "contact_person"
    t.string "contact_phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_archived"
  end

  create_table "couriers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.integer "radio_number"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_archived"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "client_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "adjustment", default: 0
  end

  create_table "tickets", force: :cascade do |t|
    t.string "pickup"
    t.string "dropoff"
    t.datetime "time_ready"
    t.datetime "time_due"
    t.boolean "is_rush"
    t.string "rush_details"
    t.integer "rush_charge"
    t.boolean "is_oversize"
    t.string "oversize_details"
    t.integer "oversize_charge"
    t.text "notes"
    t.integer "additional_charge"
    t.integer "base_charge"
    t.integer "courier_id"
    t.integer "client_id"
    t.boolean "is_complete"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pod"
    t.datetime "time_delivered"
    t.boolean "is_roundtrip"
    t.string "roundtrip_details"
    t.string "roundtrip_charge"
    t.string "return_pod"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
