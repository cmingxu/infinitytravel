# -*- encoding : utf-8 -*-
class AddAncestryToDestinations < ActiveRecord::Migration
  def self.up
    add_column :destinations, :ancestry, :string
    add_index :destinations, :ancestry
  end

  def self.down
    remove_column :destinations, :ancestry
    remove_index :destinations, :ancestry
  end
end
