class Comic < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :comic_reviews
  validates :title, presence: true
  validates :editeur, presence: true
  validates :artist, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :genre, inclusion: { in: ["adventure", "aviation", "fantastic", "history", "science-fiction", "western", "thriller", "adult", "manga"], allow_nil: false }
  validates :state, inclusion: { in: ["Good condition", "Average condition", "Bad condition"], allow_nil: false }
end
