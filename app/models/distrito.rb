# frozen_string_literal: true

class Distrito < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :municipio
end
