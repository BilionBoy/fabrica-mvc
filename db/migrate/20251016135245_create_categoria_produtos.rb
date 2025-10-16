# frozen_string_literal: true

class CreateCategoriaProdutos < ActiveRecord::Migration[7.2]
  def up
    create_table :categoria_produtos, if_not_exists: true do |t|
      t.references :empresa, null: false, foreign_key: true
      t.string :nome, null: false, limit: 100
      t.text :descricao
      t.boolean :ativo, default: true

      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :categoria_produtos, if_exists: true
  end
end
