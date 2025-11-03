# frozen_string_literal: true

class CreateColumns < ActiveRecord::Migration[7.2]
  def up
    create_table :columns do |t|
      t.string :title
      t.references :task
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :columns
  end
end
