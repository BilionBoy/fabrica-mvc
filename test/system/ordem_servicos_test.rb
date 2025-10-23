require "application_system_test_case"

class OrdemServicosTest < ApplicationSystemTestCase
  setup do
    @ordem_servico = ordem_servicos(:one)
  end

  test "visiting the index" do
    visit ordem_servicos_url
    assert_selector "h1", text: "Ordem servicos"
  end

  test "should create ordem servico" do
    visit ordem_servicos_url
    click_on "New ordem servico"

    fill_in "Cliente", with: @ordem_servico.cliente_id
    fill_in "Data agendamento", with: @ordem_servico.data_agendamento
    fill_in "Data fechamento", with: @ordem_servico.data_fechamento
    fill_in "Observacao", with: @ordem_servico.observacao
    fill_in "Prioridade", with: @ordem_servico.prioridade
    fill_in "Status", with: @ordem_servico.status_id
    fill_in "Valor toal", with: @ordem_servico.valor_toal
    click_on "Create Ordem servico"

    assert_text "Ordem servico was successfully created"
    click_on "Back"
  end

  test "should update Ordem servico" do
    visit ordem_servico_url(@ordem_servico)
    click_on "Edit this ordem servico", match: :first

    fill_in "Cliente", with: @ordem_servico.cliente_id
    fill_in "Data agendamento", with: @ordem_servico.data_agendamento
    fill_in "Data fechamento", with: @ordem_servico.data_fechamento
    fill_in "Observacao", with: @ordem_servico.observacao
    fill_in "Prioridade", with: @ordem_servico.prioridade
    fill_in "Status", with: @ordem_servico.status_id
    fill_in "Valor toal", with: @ordem_servico.valor_toal
    click_on "Update Ordem servico"

    assert_text "Ordem servico was successfully updated"
    click_on "Back"
  end

  test "should destroy Ordem servico" do
    visit ordem_servico_url(@ordem_servico)
    click_on "Destroy this ordem servico", match: :first

    assert_text "Ordem servico was successfully destroyed"
  end
end
