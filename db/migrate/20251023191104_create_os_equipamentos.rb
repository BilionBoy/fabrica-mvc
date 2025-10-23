# frozen_string_literal: true

class CreateOsEquipamentos < ActiveRecord::Migration[7.2]
  def up
    create_table :os_equipamentos do |t|
      t.references :equipamento
      t.references :ordem_servico
      t.string :laudo
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :os_equipamentos
  end
end
