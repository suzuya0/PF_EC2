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

ActiveRecord::Schema.define(version: 2021_10_07_051906) do

  create_table "bartered_item_images", force: :cascade do |t|
    t.integer "bartered_item_id", null: false
    t.string "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bartered_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "explanation", null: false
    t.integer "barter_way", null: false
    t.integer "desired_place", null: false
    t.integer "no1_wanted_item_id"
    t.integer "no2_wanted_item_id"
    t.integer "no3_wanted_item_id"
    t.integer "barter_status", default: 0, null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nick_name", null: false
    t.text "introduction"
    t.integer "barter_way"
    t.integer "desired_place"
    t.string "image_id"
    t.float "evalution"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
