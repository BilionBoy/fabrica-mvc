# frozen_string_literal: true
 
class OsEquipamento < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :equipamento
  belongs_to :ordem_servico

end
