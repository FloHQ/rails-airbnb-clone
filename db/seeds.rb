# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts 'cleaning the db'
Booking.destroy_all
NannyOffer.destroy_all
User.destroy_all
puts 'db cleaned'

puts "seeding Users"

users = [["Parent", "One"],["Parent","Two"],["Nanny","One"],["Nanny","Two"]]

users.each do |u|
  user = User.new
  user.email = "#{u[0]}#{u[1]}@example.com"
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.first_name = "#{u[0]}"
  user.last_name = "#{u[1]}"
  user.phone_number = "+33 (0) 1 02 03 04 05"
  user.age = "30"
  user.gender = ["male", "female"].sample
  user.save!
end

puts "Users seeded"


puts "Seeding offers"

User.where(first_name: "Nanny").each do |n|
  offer = NannyOffer.new
  puts offer
  offer.user_id = n.id
  puts offer.user_id
  offer.start_date =  DateTime.new(2017,12,01)
  puts offer.start_date
  offer.end_date =  DateTime.new(2017,12,19)
  puts offer.end_date
  offer.save!
end

puts "Offers seeded"

# create_table "nanny_offers", force: :cascade do |t|
#     t.bigint "user_id"
#     t.date "start_date"
#     t.date "end_date"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["user_id"], name: "index_nanny_offers_on_user_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer "sign_in_count", default: 0, null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.inet "current_sign_in_ip"
#     t.inet "last_sign_in_ip"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "first_name"
#     t.string "last_name"
#     t.string "phone_number"
#     t.string "age"
#     t.string "gender"
#     t.string "profile_picture"
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   end
