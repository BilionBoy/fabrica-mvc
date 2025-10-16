json.extract! produto, :id, :empresa_id, :categoria_produto_id, :unidade_medida_id, :nome, :descricao, :codigo_interno, :codigo_barras, :preco_custo, :preco_venda, :estoque_minimo, :ativo, :created_by, :updated_by, :created_at, :updated_at
json.url produto_url(produto, format: :json)
