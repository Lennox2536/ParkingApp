class User < ApplicationRecord
  validates :slack_id, :name, presence: true
  has_many :bookings

  def booked_place?
    !bookings.active.empty?
  end

  def active_booking
    bookings.active.first
  end
end
