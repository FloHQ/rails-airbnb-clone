class AddDescAndChildrenToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :short_description, :text
    add_column :bookings, :children, :string
  end
end
