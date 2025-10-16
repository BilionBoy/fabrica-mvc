require "application_system_test_case"

class EntradaEstoquesTest < ApplicationSystemTestCase
  setup do
    @entrada_estoque = entradas_estoque(:one)
  end

  test "visiting the index" do
    visit entradas_estoque_url
    assert_selector "h1", text: "Entrada estoques"
  end

  test "should create entrada estoque" do
    visit entradas_estoque_url
    click_on "New entrada estoque"

    fill_in "Created by", with: @entrada_estoque.created_by
    fill_in "Data entrada", with: @entrada_estoque.data_entrada
    fill_in "Empresa", with: @entrada_estoque.empresa_id
    fill_in "Observacao", with: @entrada_estoque.observacao
    fill_in "Preco custo", with: @entrada_estoque.preco_custo
    fill_in "Produto", with: @entrada_estoque.produto_id
    fill_in "Quantidade", with: @entrada_estoque.quantidade
    click_on "Create Entrada estoque"

    assert_text "Entrada estoque was successfully created"
    click_on "Back"
  end

  test "should update Entrada estoque" do
    visit entrada_estoque_url(@entrada_estoque)
    click_on "Edit this entrada estoque", match: :first

    fill_in "Created by", with: @entrada_estoque.created_by
    fill_in "Data entrada", with: @entrada_estoque.data_entrada
    fill_in "Empresa", with: @entrada_estoque.empresa_id
    fill_in "Observacao", with: @entrada_estoque.observacao
    fill_in "Preco custo", with: @entrada_estoque.preco_custo
    fill_in "Produto", with: @entrada_estoque.produto_id
    fill_in "Quantidade", with: @entrada_estoque.quantidade
    click_on "Update Entrada estoque"

    assert_text "Entrada estoque was successfully updated"
    click_on "Back"
  end

  test "should destroy Entrada estoque" do
    visit entrada_estoque_url(@entrada_estoque)
    click_on "Destroy this entrada estoque", match: :first

    assert_text "Entrada estoque was successfully destroyed"
  end
end
