# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Remove everything else

  # def default_url
  #   "/assets/images/no_appartment_photo.jpg"
  # end
end
