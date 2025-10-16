json.extract! categoria_produto, :id, :empresa_id, :nome, :descricao, :ativo, :created_at, :updated_at
json.url categoria_produto_url(categoria_produto, format: :json)
