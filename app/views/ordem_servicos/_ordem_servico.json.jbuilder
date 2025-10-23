json.extract! ordem_servico, :id, :cliente_id, :status_id, :data_agendamento, :data_fechamento, :observacao, :prioridade, :valor_toal, :created_at, :updated_at
json.url ordem_servico_url(ordem_servico, format: :json)
