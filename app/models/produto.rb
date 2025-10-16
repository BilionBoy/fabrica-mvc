# frozen_string_literal: true

class Produto < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :empresa
  belongs_to :categoria_produto
  belongs_to :unidade_medida
end
