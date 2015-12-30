# -*- encoding : utf-8 -*-
class AddFlashmapToDestinations < ActiveRecord::Migration
  def self.up
    add_column :destinations, :flashmap, :string
  end

  def self.down
    remove_column :destinations, :flashmap
  end
end
