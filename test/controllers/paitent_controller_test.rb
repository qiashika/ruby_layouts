require "test_helper"

class PaitentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paitent_index_url
    assert_response :success
  end
end
