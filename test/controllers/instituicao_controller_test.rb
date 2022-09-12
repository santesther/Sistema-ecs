require "test_helper"

class InstituicaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instituicao_index_url
    assert_response :success
  end

  test "should get new" do
    get instituicao_new_url
    assert_response :success
  end

  test "should get show" do
    get instituicao_show_url
    assert_response :success
  end

  test "should get create" do
    get instituicao_create_url
    assert_response :success
  end
end
