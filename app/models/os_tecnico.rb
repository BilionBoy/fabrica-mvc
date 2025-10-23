# frozen_string_literal: true

class OsTecnico < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :tecnico
  belongs_to :ordem_servico

end
