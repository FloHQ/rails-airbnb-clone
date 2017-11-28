class AddNannyOfferToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :nanny_offer, foreign_key: true
  end
end
