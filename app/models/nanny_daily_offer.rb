class NannyDailyOffer < ApplicationRecord
  belongs_to :nanny_offer
  belongs_to :booking

  validates :nanny_offer, presence: true
  validates :date, presence: true
end
