class ReleaseService < ActionService
  class << self
    def perform(user_data, place_number)
      user = user(user_data)
      place = place(place_number)

      return if place.free?

      user.active_booking.update(release: true)
    end
  end
end
