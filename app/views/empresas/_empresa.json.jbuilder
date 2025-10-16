json.extract! empresa, :id, :nome_fantasia, :razao_social, :cnpj, :email, :telefone, :endereco, :municipio_id, :status_empresa_id, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
