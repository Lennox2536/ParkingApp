require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "should not save without a user" do
    assert_not Booking.create(place: places(:one)).valid?
  end

  test "should not save without a place" do
    assert_not Booking.create(user: users(:one)).valid?
  end

  test "should save with user and place" do
    assert Booking.create(user: users(:one), place: places(:one)).valid?
  end
end
