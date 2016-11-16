class Comic < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :comic_reviews
  validates :title, presence: true
  validates :editor, presence: true
  validates :artist, presence: true
  validates :price, presence: true
  # validates :photo, presence: true
  validates :genre, inclusion: { in: ["adventure", "aviation", "fantastic", "history", "science-fiction", "western", "thriller", "adult", "manga"], allow_nil: false }
  validates :state, inclusion: { in: ["Like it was new", "Average used", "Almost a wreck"], allow_nil: false }
  mount_uploader :photo, PhotoUploader
end
