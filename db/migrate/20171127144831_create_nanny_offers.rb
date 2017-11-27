class CreateNannyOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :nanny_offers do |t|
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
