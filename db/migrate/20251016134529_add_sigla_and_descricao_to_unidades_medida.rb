# frozen_string_literal: true

class AddSiglaAndDescricaoToUnidadesMedida < ActiveRecord::Migration[7.2]
  def up
    if table_exists?(:unidades_medida)
      add_column :unidades_medida, :sigla, :string unless column_exists?(:unidades_medida, :sigla)
      add_column :unidades_medida, :descricao, :text unless column_exists?(:unidades_medida, :descricao)
    end
  end

  def down
    if table_exists?(:unidades_medida)
      remove_column :unidades_medida, :sigla if column_exists?(:unidades_medida, :sigla)
      remove_column :unidades_medida, :descricao if column_exists?(:unidades_medida, :descricao)
    end
  end
end
