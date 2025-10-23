# frozen_string_literal: true

class CreateTecnicos < ActiveRecord::Migration[7.2]
  def up
    create_table :tecnicos do |t|
      t.string :nome
      t.string :telefone
      t.string :funcao
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :tecnicos
  end
end
