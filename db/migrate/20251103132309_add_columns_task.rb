# frozen_string_literal: true

class AddColumnsTask < ActiveRecord::Migration[7.2]
  def up
       add_column :columns, :position, :integer, default: 0 unless column_exists?(:columns, :position)
       add_column :tasks , :description, :string 

  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
