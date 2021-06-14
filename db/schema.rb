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

ActiveRecord::Schema.define(version: 2021_06_14_052645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "accepted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "initiator_swap_id"
    t.integer "creator_swap_id"
    t.boolean "pending"
    t.boolean "rejected"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "swaps", force: :cascade do |t|
    t.string "module_code"
    t.string "slot_type"
    t.string "current_slot"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "desired_slots", default: [], array: true
    t.boolean "completed"
    t.boolean "reserved"
    t.string "venue"
    t.string "startTime"
    t.string "endTime"
    t.string "day"
    t.index ["user_id"], name: "index_swaps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "offers", "users"
  add_foreign_key "swaps", "users"
end
