require 'date'
require 'faker'

puts 'cleaning the db'
Booking.destroy_all
NannyOffer.destroy_all
User.destroy_all
puts 'db cleaned'

puts "seeding Users"

the_age = ["20", "25", "30", "35"]

10.times do
  user = User.new
  user.email = "#{Faker::Name.first_name}#{Faker::Name.last_name}@example.com"
  user.password = 'tabata'
  user.password_confirmation = 'tabata'
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.phone_number = "+33 (0) 1 02 03 04 05"
  user.age = the_age.sample
  user.gender = ["male", "female"].sample
  user.save!
end

puts "Users seeded"


# puts "Seeding offers"

# nanny_id = (User.first.id..User.last.id).to_a.sample(5)

# nanny_id.each do |id|
#   offer = NannyOffer.new
#   offer.user_id = id
#   offer.start_date =  DateTime.new(2017,12,01)
#   offer.end_date =  DateTime.new(2017,12,19)
#   offer.price = (100..200).to_a.sample
#   offer.save!
# end

# puts NannyOffer.last

# puts "Offers seeded"

# puts "Seeding Booking"

#   booking = Booking.new
#   booking.nanny_offer = NannyOffer.first
#   booking.user = User.first
#   booking.date = "#{booking.nanny_offer.start_date} - #{booking.nanny_offer.end_date}"
#   booking.save!

# puts "Booking seeded"
