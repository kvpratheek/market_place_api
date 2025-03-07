require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end


  test "should show user" do
    get(api_v1_user_url(@user), as: :json)
    assert_response :success
    # Test to ensure response contains the correct email
    json_response = JSON.parse(self.response.body)
    assert_equal @user.email, json_response["email"]
  end

  test("should create user") do
    post(api_v1_users_url, params: { user: { email: "kvpratheek2@gmail.com", password: "123" } }, as: :json)
    assert_response(:created)
  end
end
