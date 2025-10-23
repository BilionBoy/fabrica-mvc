# frozen_string_literal: true

class OrdemServico < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :cliente
  

end
