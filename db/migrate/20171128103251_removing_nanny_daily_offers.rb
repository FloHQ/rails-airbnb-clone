class RemovingNannyDailyOffersTableAndFixingRelatedTable < ActiveRecord::Migration[5.1]
  def change
    delete_table :nanny_daily_offers
  end
end
