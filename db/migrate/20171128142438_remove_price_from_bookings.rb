class RemovePriceFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :price, :integer
  end
end
