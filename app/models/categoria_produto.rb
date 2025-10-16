# frozen_string_literal: true

class CategoriaProduto < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :empresa
  has_many :produtos, dependent: :restrict_with_error
end
