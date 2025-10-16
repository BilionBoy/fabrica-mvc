# frozen_string_literal: true

class CreateDistritos < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:distritos)
      create_table :distritos do |t|
      t.string :nome
      t.references :municipio
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
      end
    end
  end

  def down
    drop_table :distritos if table_exists?(:distritos)
  end
end
