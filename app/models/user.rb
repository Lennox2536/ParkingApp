class User < ApplicationRecord
  validates :slack_id, :name, presence: true
  has_many :bookings
end
