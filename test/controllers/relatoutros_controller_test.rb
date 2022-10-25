require "test_helper"

class RelatoutrosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get relatoutros_index_url
    assert_response :success
  end

  test "should get edit" do
    get relatoutros_edit_url
    assert_response :success
  end
end
