# frozen_string_literal: true

class CreateBairros < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:bairros)
      create_table :bairros do |t|
      t.string :nome
      t.references :municipio, foreign_key: true
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
      end
    end
  end

  def down
    drop_table :bairros
  end
end
