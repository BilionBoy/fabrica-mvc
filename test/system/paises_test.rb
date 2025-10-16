require "application_system_test_case"

class PaisesTest < ApplicationSystemTestCase
  setup do
    @pais = paises(:one)
  end

  test "visiting the index" do
    visit paises_url
    assert_selector "h1", text: "Paises"
  end

  test "should create pais" do
    visit paises_url
    click_on "New pais"

    fill_in "Nome", with: @pais.nome
    fill_in "Sigla", with: @pais.sigla
    click_on "Create Pais"

    assert_text "Pais was successfully created"
    click_on "Back"
  end

  test "should update Pais" do
    visit pais_url(@pais)
    click_on "Edit this pais", match: :first

    fill_in "Nome", with: @pais.nome
    fill_in "Sigla", with: @pais.sigla
    click_on "Update Pais"

    assert_text "Pais was successfully updated"
    click_on "Back"
  end

  test "should destroy Pais" do
    visit pais_url(@pais)
    click_on "Destroy this pais", match: :first

    assert_text "Pais was successfully destroyed"
  end
end
