# frozen_string_literal: true

class CreateTipoUsuarios < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:tipo_usuarios)
      create_table :tipo_usuarios do |t|
        t.string :descricao

        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :tipo_usuarios if table_exists?(:tipo_usuarios)
  end
end