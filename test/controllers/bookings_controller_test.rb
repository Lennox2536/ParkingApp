require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to root if not logged in" do
    get my_booking_path

    assert_redirected_to root_path
  end

  test "should not release if not logged in" do
    get release_path

    assert_redirected_to root_path
  end
end
