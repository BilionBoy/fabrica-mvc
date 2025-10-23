# frozen_string_literal: true

class CreateOsServicos < ActiveRecord::Migration[7.2]
  def up
    create_table :os_servicos do |t|
      t.references :servico
      t.decimal :quantidade
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :os_servicos
  end
end
