require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # Include Devise helpers for authentication

  setup do
    @user = users(:one)  # Load user fixture
    sign_in @user        # Log in the user
  end

  test "should get show" do
    get profile_path  # Use `profile_path` instead of `user_path(@user)`
    assert_response :success  # Expect HTTP 200 OK response
  end
end
