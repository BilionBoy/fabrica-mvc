require "test_helper"

class SaidaEstoquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saida_estoque = saida_estoques(:one)
  end

  test "should get index" do
    get saida_estoques_url
    assert_response :success
  end

  test "should get new" do
    get new_saida_estoque_url
    assert_response :success
  end

  test "should create saida_estoque" do
    assert_difference("SaidaEstoque.count") do
      post saida_estoques_url, params: { saida_estoque: { created_at: @saida_estoque.created_at, created_by: @saida_estoque.created_by, data_saida: @saida_estoque.data_saida, empresa: @saida_estoque.empresa, observacao: @saida_estoque.observacao, produto: @saida_estoque.produto, quantidade: @saida_estoque.quantidade } }
    end

    assert_redirected_to saida_estoque_url(SaidaEstoque.last)
  end

  test "should show saida_estoque" do
    get saida_estoque_url(@saida_estoque)
    assert_response :success
  end

  test "should get edit" do
    get edit_saida_estoque_url(@saida_estoque)
    assert_response :success
  end

  test "should update saida_estoque" do
    patch saida_estoque_url(@saida_estoque), params: { saida_estoque: { created_at: @saida_estoque.created_at, created_by: @saida_estoque.created_by, data_saida: @saida_estoque.data_saida, empresa: @saida_estoque.empresa, observacao: @saida_estoque.observacao, produto: @saida_estoque.produto, quantidade: @saida_estoque.quantidade } }
    assert_redirected_to saida_estoque_url(@saida_estoque)
  end

  test "should destroy saida_estoque" do
    assert_difference("SaidaEstoque.count", -1) do
      delete saida_estoque_url(@saida_estoque)
    end

    assert_redirected_to saida_estoques_url
  end
end
