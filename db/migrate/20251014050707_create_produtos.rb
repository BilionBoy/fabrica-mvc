# frozen_string_literal: true

class CreateProdutos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:produtos)
      create_table :produtos do |t|
        t.string :nome
        t.string :descricao
        t.references :categoria
            
        t.string :created_by
        t.string :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :produtos if table_exists?(:produtos)
  end
end
