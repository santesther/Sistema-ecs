require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get def" do
    get users_def_url
    assert_response :success
  end

  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get set_user" do
    get users_set_user_url
    assert_response :success
  end
end
