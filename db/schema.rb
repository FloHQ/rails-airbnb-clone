ActiveRecord::Schema.define(version: 20171128104711) do

 # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

 create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nanny_offer_id"
    t.index ["nanny_offer_id"], name: "index_bookings_on_nanny_offer_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

 create_table "nanny_offers", force: :cascade do |t|
    t.bigint "user_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nanny_offers_on_user_id"
  end

 create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "user_id"
    t.bigint "nanny_offer_id"
    t.index ["nanny_offer_id"], name: "index_reviews_on_nanny_offer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

 create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "age"
    t.string "gender"
    t.string "profile_picture"
    t.string "appartment_equipment"
    t.string "appartment_rules"
    t.string "appartment_address"
    t.string "appartment_photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

 add_foreign_key "bookings", "nanny_offers"
  add_foreign_key "bookings", "users"
  add_foreign_key "nanny_offers", "users"
  add_foreign_key "reviews", "nanny_offers"
  add_foreign_key "reviews", "users"
end
