class AddDatesToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :start_date, :string
    add_column :bookings, :end_date, :string
  end
end
