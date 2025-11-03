# frozen_string_literal: true

class Column < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
    has_many :tasks, dependent: :destroy
    validates :title, presence: true
end
