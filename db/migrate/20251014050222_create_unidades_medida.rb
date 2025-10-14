# frozen_string_literal: true

class CreateUnidadesMedida < ActiveRecord::Migration[7.2]
   def up
     unless table_exists?(:unidades_medida)
       create_table :unidades_medida do |t|
         t.string :nome
             
         t.string :created_by
         t.string :updated_by
         t.datetime :deleted_at
         t.timestamps
       end
    end
  end

  def down
    drop_table :unidades_medida if table_exists?(:unidades_medida)
  end
end
