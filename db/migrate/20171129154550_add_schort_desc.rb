class AddSchortDesc < ActiveRecord::Migration[5.1]
  def change
    add_column :nanny_offers, :short_description, :integer
  end
end
