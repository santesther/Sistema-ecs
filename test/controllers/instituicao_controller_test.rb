require "test_helper"

class InstituicaoControllerTest < ActionDispatch::IntegrationTest
  test "should get def" do
    get instituicao_def_url
    assert_response :success
  end

  test "should get index" do
    get instituicao_index_url
    assert_response :success
  end
end
