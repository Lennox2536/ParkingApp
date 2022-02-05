require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save without name" do
    assert_not User.create(slack_id: "slack_id").valid?
  end

  test "should not save without slack_id" do
    assert_not User.create(name: "name").valid?
  end

  test "should be true the day of reservation" do
    assert users(:one).booked_place?
  end

  test "should be false the following day" do
    travel(1.day)
    assert_not users(:one).booked_place?
  end

  test "should be false after release" do
    bookings(:one).update(release: true)
    assert_not users(:one).booked_place?
  end
end
