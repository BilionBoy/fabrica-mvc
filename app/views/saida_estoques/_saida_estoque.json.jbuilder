json.extract! saida_estoque, :id, :empresa, :produto, :quantidade, :data_saida, :observacao, :created_by, :created_at, :created_at, :updated_at
json.url saida_estoque_url(saida_estoque, format: :json)
