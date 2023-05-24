require "test_helper"

class ViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get view_index_url
    assert_response :success
  end
end
