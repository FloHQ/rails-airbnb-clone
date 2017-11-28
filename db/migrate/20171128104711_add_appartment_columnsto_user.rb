class AddAppartmentColumnstoUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :appartment_equipment, :string
    add_column :users, :appartment_rules, :string
    add_column :users, :appartment_address, :string
    add_column :users, :appartment_photo, :string
  end
end
