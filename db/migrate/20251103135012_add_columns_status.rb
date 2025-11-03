# frozen_string_literal: true

class AddColumnsStatus < ActiveRecord::Migration[7.2]
  def up
    add_column :tasks , :status, :integer 
  end

  def down
    # Adicione aqui o código para "reverter" (desfazer alterações feitas no método `up`)
  end
end
