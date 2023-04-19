require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get profile_page_url
    assert_response :success
  end
end
