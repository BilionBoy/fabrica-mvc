# frozen_string_literal: true

class CreateStatusEmpresas < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:status_empresas)
      create_table :status_empresas do |t|
        t.string :descricao

        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :status_empresas if table_exists?(:status_empresas)
  end
end
