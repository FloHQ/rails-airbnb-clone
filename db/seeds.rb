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
  offer.price = (10..100).to_a.sample
  puts offer.price
  offer.save!
end

puts "Offers seeded"

puts "Seeding Booking"

  booking = Booking.new
  puts booking
  booking.nanny_offer = NannyOffer.first
  puts booking.nanny_offer
  booking.user = User.first
  puts booking.user
  booking.date = "#{booking.nanny_offer.start_date} - #{booking.nanny_offer.end_date}"
  booking.save!

puts "Booking seeded"
