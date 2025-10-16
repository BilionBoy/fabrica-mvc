# frozen_string_literal: true

class Estado < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :pais
end
