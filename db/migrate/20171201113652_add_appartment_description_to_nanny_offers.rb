class AddAppartmentDescriptionToNannyOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :nanny_offers, :appartment_description, :text
  end
end
