# frozen_string_literal: true

class CreateEstados < ActiveRecord::Migration[7.2]
  def up
    unless table_exists?(:estados)
     create_table :estados do |t|
      t.string :nome
      t.string :sigla
      t.references :pais, foreign_key: true
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
     end
    end
  end

  def down
    drop_table :estados if table_exists?(:estados)
  end
end
