class AddSearchDistanceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :search_distance, :integer
  end
end
