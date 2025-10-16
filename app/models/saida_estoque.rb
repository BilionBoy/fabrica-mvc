# frozen_string_literal: true

class SaidaEstoque < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :empresa
  belongs_to :produto
end
