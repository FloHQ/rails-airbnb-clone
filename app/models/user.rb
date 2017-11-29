class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :nanny_offers
  has_many :reviews
  has_many :bookings

  mount_uploader :profile_picture, PhotoUploader
  mount_uploader :appartment_picture, PhotoUploader
end
