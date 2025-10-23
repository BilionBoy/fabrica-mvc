# frozen_string_literal: true

class Cliente < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
   has_many   :enderecos
   has_many   :telefones
end
