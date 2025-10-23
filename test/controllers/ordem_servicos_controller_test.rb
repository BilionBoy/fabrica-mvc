require "test_helper"

class OrdemServicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ordem_servico = ordem_servicos(:one)
  end

  test "should get index" do
    get ordem_servicos_url
    assert_response :success
  end

  test "should get new" do
    get new_ordem_servico_url
    assert_response :success
  end

  test "should create ordem_servico" do
    assert_difference("OrdemServico.count") do
      post ordem_servicos_url, params: { ordem_servico: { cliente_id: @ordem_servico.cliente_id, data_agendamento: @ordem_servico.data_agendamento, data_fechamento: @ordem_servico.data_fechamento, observacao: @ordem_servico.observacao, prioridade: @ordem_servico.prioridade, status_id: @ordem_servico.status_id, valor_toal: @ordem_servico.valor_toal } }
    end

    assert_redirected_to ordem_servico_url(OrdemServico.last)
  end

  test "should show ordem_servico" do
    get ordem_servico_url(@ordem_servico)
    assert_response :success
  end

  test "should get edit" do
    get edit_ordem_servico_url(@ordem_servico)
    assert_response :success
  end

  test "should update ordem_servico" do
    patch ordem_servico_url(@ordem_servico), params: { ordem_servico: { cliente_id: @ordem_servico.cliente_id, data_agendamento: @ordem_servico.data_agendamento, data_fechamento: @ordem_servico.data_fechamento, observacao: @ordem_servico.observacao, prioridade: @ordem_servico.prioridade, status_id: @ordem_servico.status_id, valor_toal: @ordem_servico.valor_toal } }
    assert_redirected_to ordem_servico_url(@ordem_servico)
  end

  test "should destroy ordem_servico" do
    assert_difference("OrdemServico.count", -1) do
      delete ordem_servico_url(@ordem_servico)
    end

    assert_redirected_to ordem_servicos_url
  end
end
