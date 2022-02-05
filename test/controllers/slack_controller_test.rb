require "test_helper"

class SlackControllerTest < ActionDispatch::IntegrationTest
  test "should refuse invalid signature" do
    post slack_book_path
    assert_equal '{"text":"Unauthorized"}', @response.body
  end
end
