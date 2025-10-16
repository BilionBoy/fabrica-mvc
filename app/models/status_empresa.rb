# frozen_string_literal: true

class StatusEmpresa < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  has_many :empresas
end
