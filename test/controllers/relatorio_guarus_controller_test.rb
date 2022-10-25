require "test_helper"

class RelatorioGuarusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get relatorio_guarus_index_url
    assert_response :success
  end

  test "should get edit" do
    get relatorio_guarus_edit_url
    assert_response :success
  end
end
