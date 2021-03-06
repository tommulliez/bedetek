# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end
   version :standardplus do
    resize_to_fit 800, 600
  end

  version :resize do
    resize_to_fit 300, 150
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end

end
