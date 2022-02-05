class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place

  scope :active, -> { where('created_at >= ? AND created_at < ? AND release = false', Date.today, Date.tomorrow) }
  scope :by_created_at, -> { order(created_at: :desc) }
end
