require "test_helper"

class SectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get section_index_url
    assert_response :success
  end
end
