# frozen_string_literal: true

class CreateTelefones < ActiveRecord::Migration[7.2]
  def up
    create_table :telefones do |t|
      t.string :numero
      t.references :cliente
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :telefones
  end
end
