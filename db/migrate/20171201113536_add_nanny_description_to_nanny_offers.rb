class AddNannyDescriptionToNannyOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :nanny_offers, :nanny_description, :text
  end
end
