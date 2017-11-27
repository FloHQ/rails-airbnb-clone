class CreateNannyDailyOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :nanny_daily_offers do |t|
      t.references :nanny_offer, foreign_key: true
      t.references :booking, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
