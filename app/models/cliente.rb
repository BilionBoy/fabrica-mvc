# frozen_string_literal: true

class Cliente < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
   has_many   :enderecos, dependent: :destroy
   has_many   :telefones, dependent: :destroy

   accepts_nested_attributes_for :enderecos, allow_destroy: true, reject_if: :all_blank
   accepts_nested_attributes_for :telefones, allow_destroy: true, reject_if: :all_blank
end
