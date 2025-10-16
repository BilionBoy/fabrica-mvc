require "test_helper"

class EntradasEstoqueControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrada_estoque = entradas_estoque(:one)
  end

  test "should get index" do
    get entradas_estoque_url
    assert_response :success
  end

  test "should get new" do
    get new_entrada_estoque_url
    assert_response :success
  end

  test "should create entrada_estoque" do
    assert_difference("EntradaEstoque.count") do
      post entradas_estoque_url, params: { entrada_estoque: { created_by: @entrada_estoque.created_by, data_entrada: @entrada_estoque.data_entrada, empresa_id: @entrada_estoque.empresa_id, observacao: @entrada_estoque.observacao, preco_custo: @entrada_estoque.preco_custo, produto_id: @entrada_estoque.produto_id, quantidade: @entrada_estoque.quantidade } }
    end

    assert_redirected_to entrada_estoque_url(EntradaEstoque.last)
  end

  test "should show entrada_estoque" do
    get entrada_estoque_url(@entrada_estoque)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrada_estoque_url(@entrada_estoque)
    assert_response :success
  end

  test "should update entrada_estoque" do
    patch entrada_estoque_url(@entrada_estoque), params: { entrada_estoque: { created_by: @entrada_estoque.created_by, data_entrada: @entrada_estoque.data_entrada, empresa_id: @entrada_estoque.empresa_id, observacao: @entrada_estoque.observacao, preco_custo: @entrada_estoque.preco_custo, produto_id: @entrada_estoque.produto_id, quantidade: @entrada_estoque.quantidade } }
    assert_redirected_to entrada_estoque_url(@entrada_estoque)
  end

  test "should destroy entrada_estoque" do
    assert_difference("EntradaEstoque.count", -1) do
      delete entrada_estoque_url(@entrada_estoque)
    end

    assert_redirected_to entradas_estoque_url
  end
end
