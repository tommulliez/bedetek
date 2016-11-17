class Booking < ApplicationRecord
  belongs_to :comic
  belongs_to :user
  has_one :order

  def pay!
    order.payed = true
    order.save
  end
end
