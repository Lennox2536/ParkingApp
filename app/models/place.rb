class Place < ApplicationRecord
  validates :number, presence: true
  has_many :bookings

  def free?
    bookings.active.empty?
  end
end
