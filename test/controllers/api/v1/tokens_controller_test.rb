require "test_helper"

class Api::V1::TokensControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
  end

  test "should get create" do
    post(api_v1_tokens_url, params: { user: { email: "kvpratheek@gmail.com", password: "Pratheek@1234" } }, as: :json)
    assert_response :unauthorized
  end
end
