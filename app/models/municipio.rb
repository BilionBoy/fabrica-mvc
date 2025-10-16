# frozen_string_literal: true

class Municipio < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :estado
  has_many   :distritos
  has_many   :empresas
end
