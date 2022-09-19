require "application_system_test_case"

class InstituicaosTest < ApplicationSystemTestCase
  setup do
    @instituicao = instituicaos(:one)
  end

  test "visiting the index" do
    visit instituicaos_url
    assert_selector "h1", text: "Instituicaos"
  end

  test "should create instituicao" do
    visit instituicaos_url
    click_on "New instituicao"

    fill_in "Bairro da instituicao", with: @instituicao.bairro_da_instituicao
    fill_in "Cep da instituicao", with: @instituicao.cep_da_instituicao
    fill_in "Cnpj", with: @instituicao.cnpj
    fill_in "Complemento da instituicao", with: @instituicao.complemento_da_instituicao
    fill_in "Endereco da instituicao", with: @instituicao.endereco_da_instituicao
    fill_in "Municipio da instituicao", with: @instituicao.municipio_da_instituicao
    fill_in "Nome da instituicao", with: @instituicao.nome_da_instituicao
    fill_in "Numero da instituicao", with: @instituicao.numero_da_instituicao
    fill_in "Representante", with: @instituicao.representante
    fill_in "Telefone da instituicao", with: @instituicao.telefone_da_instituicao
    fill_in "User", with: @instituicao.user_id
    click_on "Create Instituicao"

    assert_text "Instituicao was successfully created"
    click_on "Back"
  end

  test "should update Instituicao" do
    visit instituicao_url(@instituicao)
    click_on "Edit this instituicao", match: :first

    fill_in "Bairro da instituicao", with: @instituicao.bairro_da_instituicao
    fill_in "Cep da instituicao", with: @instituicao.cep_da_instituicao
    fill_in "Cnpj", with: @instituicao.cnpj
    fill_in "Complemento da instituicao", with: @instituicao.complemento_da_instituicao
    fill_in "Endereco da instituicao", with: @instituicao.endereco_da_instituicao
    fill_in "Municipio da instituicao", with: @instituicao.municipio_da_instituicao
    fill_in "Nome da instituicao", with: @instituicao.nome_da_instituicao
    fill_in "Numero da instituicao", with: @instituicao.numero_da_instituicao
    fill_in "Representante", with: @instituicao.representante
    fill_in "Telefone da instituicao", with: @instituicao.telefone_da_instituicao
    fill_in "User", with: @instituicao.user_id
    click_on "Update Instituicao"

    assert_text "Instituicao was successfully updated"
    click_on "Back"
  end

  test "should destroy Instituicao" do
    visit instituicao_url(@instituicao)
    click_on "Destroy this instituicao", match: :first

    assert_text "Instituicao was successfully destroyed"
  end
end
