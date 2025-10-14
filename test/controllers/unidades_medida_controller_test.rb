require "test_helper"

class UnidadesMedidaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unidade_medida = unidades_medida(:one)
  end

  test "should get index" do
    get unidades_medida_url
    assert_response :success
  end

  test "should get new" do
    get new_unidade_medida_url
    assert_response :success
  end

  test "should create unidade_medida" do
    assert_difference("UnidadeMedida.count") do
      post unidades_medida_url, params: { unidade_medida: { nome: @unidade_medida.nome } }
    end

    assert_redirected_to unidade_medida_url(UnidadeMedida.last)
  end

  test "should show unidade_medida" do
    get unidade_medida_url(@unidade_medida)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidade_medida_url(@unidade_medida)
    assert_response :success
  end

  test "should update unidade_medida" do
    patch unidade_medida_url(@unidade_medida), params: { unidade_medida: { nome: @unidade_medida.nome } }
    assert_redirected_to unidade_medida_url(@unidade_medida)
  end

  test "should destroy unidade_medida" do
    assert_difference("UnidadeMedida.count", -1) do
      delete unidade_medida_url(@unidade_medida)
    end

    assert_redirected_to unidades_medida_url
  end
end
