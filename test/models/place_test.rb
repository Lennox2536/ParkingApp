require "test_helper"

class PlaceTest < ActiveSupport::TestCase
  test "should be free next day" do
    travel(1.day)
    assert places(:one).free?
  end

  test "should not be free" do
    assert_not places(:one).free?
  end
end
