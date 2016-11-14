class Profil < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :city, prsence: true
end
