require "application_system_test_case"

class StatusEmpresasTest < ApplicationSystemTestCase
  setup do
    @status_empresa = status_empresas(:one)
  end

  test "visiting the index" do
    visit status_empresas_url
    assert_selector "h1", text: "Status empresas"
  end

  test "should create status empresa" do
    visit status_empresas_url
    click_on "New status empresa"

    fill_in "Descricao", with: @status_empresa.descricao
    click_on "Create Status empresa"

    assert_text "Status empresa was successfully created"
    click_on "Back"
  end

  test "should update Status empresa" do
    visit status_empresa_url(@status_empresa)
    click_on "Edit this status empresa", match: :first

    fill_in "Descricao", with: @status_empresa.descricao
    click_on "Update Status empresa"

    assert_text "Status empresa was successfully updated"
    click_on "Back"
  end

  test "should destroy Status empresa" do
    visit status_empresa_url(@status_empresa)
    click_on "Destroy this status empresa", match: :first

    assert_text "Status empresa was successfully destroyed"
  end
end
