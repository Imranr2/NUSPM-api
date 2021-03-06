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

ActiveRecord::Schema.define(version: 2021_07_09_132058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notifications", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.boolean "accepted"
    t.boolean "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "initiator_user_id"
    t.bigint "creator_user_id"
    t.bigint "initiator_swap_id"
    t.bigint "creator_swap_id"
    t.index ["creator_swap_id"], name: "index_offers_on_creator_swap_id"
    t.index ["creator_user_id"], name: "index_offers_on_creator_user_id"
    t.index ["initiator_swap_id"], name: "index_offers_on_initiator_swap_id"
    t.index ["initiator_user_id"], name: "index_offers_on_initiator_user_id"
  end

  create_table "swaps", force: :cascade do |t|
    t.string "module_code"
    t.string "slot_type"
    t.string "current_slot"
    t.boolean "completed"
    t.string "venue"
    t.string "startTime"
    t.string "endTime"
    t.string "day"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "desired_slots", default: [], array: true
    t.index ["user_id"], name: "index_swaps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "notifications", "users"
  add_foreign_key "offers", "swaps", column: "creator_swap_id"
  add_foreign_key "offers", "swaps", column: "initiator_swap_id"
  add_foreign_key "offers", "users", column: "creator_user_id"
  add_foreign_key "offers", "users", column: "initiator_user_id"
  add_foreign_key "swaps", "users"
end
