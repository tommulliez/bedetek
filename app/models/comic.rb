class Comic < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :comic_reviews
end
