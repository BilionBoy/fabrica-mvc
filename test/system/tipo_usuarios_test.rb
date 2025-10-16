require "application_system_test_case"

class TipoUsuariosTest < ApplicationSystemTestCase
  setup do
    @tipo_usuario = tipo_usuarios(:one)
  end

  test "visiting the index" do
    visit tipo_usuarios_url
    assert_selector "h1", text: "Tipo usuarios"
  end

  test "should create tipo usuario" do
    visit tipo_usuarios_url
    click_on "New tipo usuario"

    fill_in "Descricao", with: @tipo_usuario.descricao
    click_on "Create Tipo usuario"

    assert_text "Tipo usuario was successfully created"
    click_on "Back"
  end

  test "should update Tipo usuario" do
    visit tipo_usuario_url(@tipo_usuario)
    click_on "Edit this tipo usuario", match: :first

    fill_in "Descricao", with: @tipo_usuario.descricao
    click_on "Update Tipo usuario"

    assert_text "Tipo usuario was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo usuario" do
    visit tipo_usuario_url(@tipo_usuario)
    click_on "Destroy this tipo usuario", match: :first

    assert_text "Tipo usuario was successfully destroyed"
  end
end
