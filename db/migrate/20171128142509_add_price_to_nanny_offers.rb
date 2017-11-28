class AddPriceToNannyOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :nanny_offers, :price, :integer
  end
end
