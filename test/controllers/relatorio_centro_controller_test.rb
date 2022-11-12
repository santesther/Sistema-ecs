require "test_helper"

class RelatorioCentroControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get relatorio_centro_edit_url
    assert_response :success
  end

  test "should get index" do
    get relatorio_centro_index_url
    assert_response :success
  end
end
