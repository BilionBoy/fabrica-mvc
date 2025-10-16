require "application_system_test_case"

class DistritosTest < ApplicationSystemTestCase
  setup do
    @distrito = distritos(:one)
  end

  test "visiting the index" do
    visit distritos_url
    assert_selector "h1", text: "Distritos"
  end

  test "should create distrito" do
    visit distritos_url
    click_on "New distrito"

    fill_in "Municipio", with: @distrito.municipio_id
    fill_in "Nome", with: @distrito.nome
    click_on "Create Distrito"

    assert_text "Distrito was successfully created"
    click_on "Back"
  end

  test "should update Distrito" do
    visit distrito_url(@distrito)
    click_on "Edit this distrito", match: :first

    fill_in "Municipio", with: @distrito.municipio_id
    fill_in "Nome", with: @distrito.nome
    click_on "Update Distrito"

    assert_text "Distrito was successfully updated"
    click_on "Back"
  end

  test "should destroy Distrito" do
    visit distrito_url(@distrito)
    click_on "Destroy this distrito", match: :first

    assert_text "Distrito was successfully destroyed"
  end
end
