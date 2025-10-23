# frozen_string_literal: true

class CreateEquipamentos < ActiveRecord::Migration[7.2]
  def up
    create_table :equipamentos do |t|
      t.references :cliente
      t.string :marca
      t.string :modelo
      t.string :num_serie
      t.string :capacidade
      t.string :complemento
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :equipamentos
  end
end
