require "test_helper"

class EstagioWelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get estagio_welcome_index_url
    assert_response :success
  end

  test "should get edit" do
    get estagio_welcome_edit_url
    assert_response :success
  end

  test "should get update" do
    get estagio_welcome_update_url
    assert_response :success
  end
end
