# frozen_string_literal: true

class OsProduto < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos

   belongs_to :produto
   belongs_to :ordem_servico
end
