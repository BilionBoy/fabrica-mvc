# frozen_string_literal: true

class CreateFiliais < ActiveRecord::Migration[7.2]
  def up
    create_table :filiais do |t|
      t.string :nome
      t.string :descricao
      t.references :empresa,   null: false, foreign_key: true
      t.references :municipio, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :filiais
  end
end
