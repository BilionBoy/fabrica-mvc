require "test_helper"

class ProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produto = produtos(:one)
  end

  test "should get index" do
    get produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_url
    assert_response :success
  end

  test "should create produto" do
    assert_difference("Produto.count") do
      post produtos_url, params: { produto: { ativo: @produto.ativo, categoria_produto_id: @produto.categoria_produto_id, codigo_barras: @produto.codigo_barras, codigo_interno: @produto.codigo_interno, created_by: @produto.created_by, descricao: @produto.descricao, empresa_id: @produto.empresa_id, estoque_minimo: @produto.estoque_minimo, nome: @produto.nome, preco_custo: @produto.preco_custo, preco_venda: @produto.preco_venda, unidade_medida_id: @produto.unidade_medida_id, updated_by: @produto.updated_by } }
    end

    assert_redirected_to produto_url(Produto.last)
  end

  test "should show produto" do
    get produto_url(@produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_url(@produto)
    assert_response :success
  end

  test "should update produto" do
    patch produto_url(@produto), params: { produto: { ativo: @produto.ativo, categoria_produto_id: @produto.categoria_produto_id, codigo_barras: @produto.codigo_barras, codigo_interno: @produto.codigo_interno, created_by: @produto.created_by, descricao: @produto.descricao, empresa_id: @produto.empresa_id, estoque_minimo: @produto.estoque_minimo, nome: @produto.nome, preco_custo: @produto.preco_custo, preco_venda: @produto.preco_venda, unidade_medida_id: @produto.unidade_medida_id, updated_by: @produto.updated_by } }
    assert_redirected_to produto_url(@produto)
  end

  test "should destroy produto" do
    assert_difference("Produto.count", -1) do
      delete produto_url(@produto)
    end

    assert_redirected_to produtos_url
  end
end
