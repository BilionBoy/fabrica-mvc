# frozen_string_literal: true

class Filial < ApplicationRecord
  belongs_to :empresa
  belongs_to :municipio

  validates :nome,   presence: true
  validates :cnpj,   presence: true

end
