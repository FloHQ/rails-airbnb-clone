class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :nanny_offer

  validates :user, presence: true
end
