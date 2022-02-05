require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should not log in with invalid code" do
    get auth_slack_callback_path, params: { code: 'Invalid code' }

    assert_equal 'Something went wrong', flash.alert
  end

  test "should not log out if not logged in" do
    get logout_path

    assert_equal 'You must be logged in', flash.alert
  end
end
