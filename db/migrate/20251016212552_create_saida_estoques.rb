# frozen_string_literal: true

class CreateSaidaEstoques < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:saida_estoques)
      create_table :saida_estoques do |t|
        t.references :empresa, foreign_key: true
        t.references :produto, foreign_key: true

        t.integer :quantidade, null: false
        t.date :data_saida, null: false
        t.text :observacao

        t.integer :created_by
        t.integer :updated_by
        t.datetime :deleted_at
        t.timestamps
      end
    end
  end

  def down
    drop_table :saida_estoques, if_exists: true
  end
end
