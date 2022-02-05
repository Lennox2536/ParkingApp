class BookingService < ActionService
  class << self
    def perform(user_data, place_number)
      user = user(user_data)
      place = place(place_number)

      return unless place.free?

      Booking.create(user: user, place: place)
    end
  end
end
