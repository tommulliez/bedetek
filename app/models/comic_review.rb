class ComicReview < ApplicationRecord
  belongs_to :comic
  belongs_to :user
  validates :comment, presence: true
end
