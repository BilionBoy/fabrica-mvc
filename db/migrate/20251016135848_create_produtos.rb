# frozen_string_literal: true

class CreateProdutos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:produtos)
      create_table :produtos do |t|
        t.references :empresa, null: false, foreign_key: true
        t.references :categoria_produto, null: false, foreign_key: true
        t.references :unidade_medida, null: false, foreign_key: true
        t.string :nome, null: false
        t.text :descricao
        t.string :codigo_interno
        t.string :codigo_barras
        t.decimal :preco_custo, precision: 10, scale: 2
        t.decimal :preco_venda, precision: 10, scale: 2
        t.integer :estoque_minimo, default: 0
        t.boolean :ativo, default: true

        t.integer :created_by
        t.integer :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :produtos, if_exists: true
  end
end
