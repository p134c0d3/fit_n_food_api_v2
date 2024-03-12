require "test_helper"

class WatersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get waters_index_url
    assert_response :success
  end
end
