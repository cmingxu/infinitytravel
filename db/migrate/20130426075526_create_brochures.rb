# -*- encoding : utf-8 -*-
class CreateBrochures < ActiveRecord::Migration
  def self.up
    create_table :brochures do |t|
      t.string :name
      t.text :desc
      t.string :cover
      t.string :doc
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :brochures
  end
end
