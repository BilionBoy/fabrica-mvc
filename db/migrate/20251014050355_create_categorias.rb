# frozen_string_literal: true

class CreateCategorias < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:categorias)
      create_table :categorias do |t|
        t.string :nome
        t.string :descricao
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :categorias if table_exists?(:categorias)
  end
end
