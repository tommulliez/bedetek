class Profil < ApplicationRecord
  has_one :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  # validates :country, presence: true
  validates :city, presence: true

  mount_uploader :photo, PhotoUploader
end
