class User < ApplicationRecord
  validates :slack_id, :name, presence: true
  has_many :bookings

  def booked_place?
    !bookings.active.empty?
  end
end
