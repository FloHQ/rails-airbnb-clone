class AddSearchLocationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :search_location, :string
  end
end
