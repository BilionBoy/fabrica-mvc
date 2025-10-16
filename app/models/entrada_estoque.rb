# frozen_string_literal: true

class EntradaEstoque < ApplicationRecord
  belongs_to :empresa
  belongs_to :produto
end
