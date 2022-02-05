require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should not book if not logged in" do
    get book_path
    assert_equal 'You must be logged in',  flash.alert
  end
end
