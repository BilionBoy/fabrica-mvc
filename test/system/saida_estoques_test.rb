require "application_system_test_case"

class SaidaEstoquesTest < ApplicationSystemTestCase
  setup do
    @saida_estoque = saida_estoques(:one)
  end

  test "visiting the index" do
    visit saida_estoques_url
    assert_selector "h1", text: "Saida estoques"
  end

  test "should create saida estoque" do
    visit saida_estoques_url
    click_on "New saida estoque"

    fill_in "Created at", with: @saida_estoque.created_at
    fill_in "Created by", with: @saida_estoque.created_by
    fill_in "Data saida", with: @saida_estoque.data_saida
    fill_in "Empresa", with: @saida_estoque.empresa
    fill_in "Observacao", with: @saida_estoque.observacao
    fill_in "Produto", with: @saida_estoque.produto
    fill_in "Quantidade", with: @saida_estoque.quantidade
    click_on "Create Saida estoque"

    assert_text "Saida estoque was successfully created"
    click_on "Back"
  end

  test "should update Saida estoque" do
    visit saida_estoque_url(@saida_estoque)
    click_on "Edit this saida estoque", match: :first

    fill_in "Created at", with: @saida_estoque.created_at.to_s
    fill_in "Created by", with: @saida_estoque.created_by
    fill_in "Data saida", with: @saida_estoque.data_saida
    fill_in "Empresa", with: @saida_estoque.empresa
    fill_in "Observacao", with: @saida_estoque.observacao
    fill_in "Produto", with: @saida_estoque.produto
    fill_in "Quantidade", with: @saida_estoque.quantidade
    click_on "Update Saida estoque"

    assert_text "Saida estoque was successfully updated"
    click_on "Back"
  end

  test "should destroy Saida estoque" do
    visit saida_estoque_url(@saida_estoque)
    click_on "Destroy this saida estoque", match: :first

    assert_text "Saida estoque was successfully destroyed"
  end
end
