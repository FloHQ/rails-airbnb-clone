class Review < ApplicationRecord
  belongs_to :nanny_offer
  belongs_to :user

  validates :rating, presence:true
  validates :description, presence:true
end
