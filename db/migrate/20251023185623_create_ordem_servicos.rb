# frozen_string_literal: true

class CreateOrdemServicos < ActiveRecord::Migration[7.2]
  def up
    create_table :ordem_servicos do |t|
      t.references :cliente
      t.references :status
      t.date :data_agendamento
      t.date :data_fechamento
      t.string :observacao
      t.string :prioridade
      t.decimal :valor_toal
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :ordem_servicos
  end
end
