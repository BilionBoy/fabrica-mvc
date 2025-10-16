require "application_system_test_case"

class ProdutosTest < ApplicationSystemTestCase
  setup do
    @produto = produtos(:one)
  end

  test "visiting the index" do
    visit produtos_url
    assert_selector "h1", text: "Produtos"
  end

  test "should create produto" do
    visit produtos_url
    click_on "New produto"

    check "Ativo" if @produto.ativo
    fill_in "Categoria produto", with: @produto.categoria_produto_id
    fill_in "Codigo barras", with: @produto.codigo_barras
    fill_in "Codigo interno", with: @produto.codigo_interno
    fill_in "Created by", with: @produto.created_by
    fill_in "Descricao", with: @produto.descricao
    fill_in "Empresa", with: @produto.empresa_id
    fill_in "Estoque minimo", with: @produto.estoque_minimo
    fill_in "Nome", with: @produto.nome
    fill_in "Preco custo", with: @produto.preco_custo
    fill_in "Preco venda", with: @produto.preco_venda
    fill_in "Unidade medida", with: @produto.unidade_medida_id
    fill_in "Updated by", with: @produto.updated_by
    click_on "Create Produto"

    assert_text "Produto was successfully created"
    click_on "Back"
  end

  test "should update Produto" do
    visit produto_url(@produto)
    click_on "Edit this produto", match: :first

    check "Ativo" if @produto.ativo
    fill_in "Categoria produto", with: @produto.categoria_produto_id
    fill_in "Codigo barras", with: @produto.codigo_barras
    fill_in "Codigo interno", with: @produto.codigo_interno
    fill_in "Created by", with: @produto.created_by
    fill_in "Descricao", with: @produto.descricao
    fill_in "Empresa", with: @produto.empresa_id
    fill_in "Estoque minimo", with: @produto.estoque_minimo
    fill_in "Nome", with: @produto.nome
    fill_in "Preco custo", with: @produto.preco_custo
    fill_in "Preco venda", with: @produto.preco_venda
    fill_in "Unidade medida", with: @produto.unidade_medida_id
    fill_in "Updated by", with: @produto.updated_by
    click_on "Update Produto"

    assert_text "Produto was successfully updated"
    click_on "Back"
  end

  test "should destroy Produto" do
    visit produto_url(@produto)
    click_on "Destroy this produto", match: :first

    assert_text "Produto was successfully destroyed"
  end
end
