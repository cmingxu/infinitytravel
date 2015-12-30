# -*- encoding : utf-8 -*-
class CreateEditorimgs < ActiveRecord::Migration
  def self.up
    create_table :editorimgs do |t|
      t.string :name
      t.string :photo

      t.timestamps
    end
  end

  def self.down
    drop_table :editorimgs
  end
end
