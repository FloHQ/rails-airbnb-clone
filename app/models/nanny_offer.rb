class NannyOffer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
end
