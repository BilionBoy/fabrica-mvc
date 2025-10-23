json.extract! servico, :id, :descricao, :valor, :created_at, :updated_at
json.url servico_url(servico, format: :json)
