require "application_system_test_case"

class FiliaisTest < ApplicationSystemTestCase
  setup do
    @filial = filiais(:one)
  end

  test "visiting the index" do
    visit filiais_url
    assert_selector "h1", text: "Filiais"
  end

  test "should create filial" do
    visit filiais_url
    click_on "New filial"

    fill_in "Descricao", with: @filial.descricao
    fill_in "Empresa", with: @filial.empresa_id
    fill_in "Municipio", with: @filial.municipio_id
    fill_in "Nome", with: @filial.nome
    click_on "Create Filial"

    assert_text "Filial was successfully created"
    click_on "Back"
  end

  test "should update Filial" do
    visit filial_url(@filial)
    click_on "Edit this filial", match: :first

    fill_in "Descricao", with: @filial.descricao
    fill_in "Empresa", with: @filial.empresa_id
    fill_in "Municipio", with: @filial.municipio_id
    fill_in "Nome", with: @filial.nome
    click_on "Update Filial"

    assert_text "Filial was successfully updated"
    click_on "Back"
  end

  test "should destroy Filial" do
    visit filial_url(@filial)
    click_on "Destroy this filial", match: :first

    assert_text "Filial was successfully destroyed"
  end
end
