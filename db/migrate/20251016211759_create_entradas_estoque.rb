# frozen_string_literal: true

class CreateEntradasEstoque < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:entradas_estoque)
      create_table :entradas_estoque do |t|
        t.references :empresa, null: false, foreign_key: true
        t.references :produto, null: false, foreign_key: true

        t.integer :quantidade, null: false
        t.decimal :preco_custo, precision: 10, scale: 2, null: false
        t.date :data_entrada, null: false
        t.text :observacao

        t.integer :created_by
        t.integer :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :entradas_estoque, if_exists: true
  end
end
