class AddSchortDescToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :short_description, :string
  end
end
