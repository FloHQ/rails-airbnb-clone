class AddChildrenCapacityToNannyOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :nanny_offers, :children_capacity, :integer
  end
end
