class BookingService < ActionService
  class << self
    def perform(user_data, place_number)
      user = user(user_data)
      place = place(place_number)

      return unless place.free?
      return if user.booked_place?

      !!Booking.create(user: user, place: place)
    end
  end
end
