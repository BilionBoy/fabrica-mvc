# frozen_string_literal: true

class Tecnico < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos


  has_many :os_tecnico
  has_many :ordem_servicos, through: :os_tecnico
end
