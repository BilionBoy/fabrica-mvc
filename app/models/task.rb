# frozen_string_literal: true

class Task < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :column
  validates :title, :description, presence: true

   enum status: { agendado: 0, planejado: 1, em_atendimento: 2, concluido: 3 }
end
