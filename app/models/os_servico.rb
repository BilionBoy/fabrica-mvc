# frozen_string_literal: true

class OsServico < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos

  belongs_to :servico
  belongs_to :ordem_servico
end
