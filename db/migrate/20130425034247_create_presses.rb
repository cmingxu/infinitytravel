# -*- encoding : utf-8 -*-
class CreatePresses < ActiveRecord::Migration
  def self.up
    create_table :presses do |t|
      t.string :title
      t.text :cont

      t.timestamps
    end
  end

  def self.down
    drop_table :presses
  end
end
