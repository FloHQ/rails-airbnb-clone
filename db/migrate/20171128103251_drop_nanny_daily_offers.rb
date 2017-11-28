class DropNannyDailyOffers < ActiveRecord::Migration[5.1]
  def change
    drop_table :nanny_daily_offers
  end
end
