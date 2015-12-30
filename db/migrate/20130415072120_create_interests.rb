# -*- encoding : utf-8 -*-
class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.string :title
      t.text :cont
      t.string :ancestry

      t.timestamps
    end
    add_index :interests, :ancestry
  end

  def self.down
    drop_table :interests
    remove_index :interests, :ancestry
  end
end
