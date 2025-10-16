json.extract! entrada_estoque, :id, :empresa_id, :produto_id, :quantidade, :preco_custo, :data_entrada, :observacao, :created_by, :created_at, :updated_at
json.url entrada_estoque_url(entrada_estoque, format: :json)
