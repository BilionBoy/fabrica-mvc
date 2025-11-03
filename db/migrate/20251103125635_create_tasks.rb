# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.2]
  def up
    create_table :tasks do |t|
      t.string :title
      t.references :column
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
