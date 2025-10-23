# frozen_string_literal: true

class CreateOsProdutos < ActiveRecord::Migration[7.2]
  def up
    create_table :os_produtos do |t|
      t.references :produto
      t.decimal :quantidade
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :os_produtos
  end
end
