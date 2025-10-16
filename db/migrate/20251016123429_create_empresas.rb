# frozen_string_literal: true

class CreateEmpresas < ActiveRecord::Migration[7.2]
  unless table_exists?(:empresas)
    def up
      create_table :empresas do |t|
      t.string :nome_fantasia
      t.string :razao_social
      t.string :cnpj
      t.string :email
      t.string :telefone
      t.string :endereco
      t.references :municipio,      null: false, foreign_key: true
      t.references :status_empresa, null: false, foreign_key: true
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
      end
    end
  end

  def down
    drop_table :empresas if table_exists?(:empresas)
  end
end
