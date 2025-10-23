# frozen_string_literal: true

class CreateEnderecos < ActiveRecord::Migration[7.2]
  def up
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :cidade
      t.string :complemento
      t.references :cliente
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :enderecos
  end
end
