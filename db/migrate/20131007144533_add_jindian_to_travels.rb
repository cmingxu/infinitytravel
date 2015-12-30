# -*- encoding : utf-8 -*-
class AddJindianToTravels < ActiveRecord::Migration
  def self.up
    add_column :travels, :jindian, :text
  end

  def self.down
    remove_column :travels, :jindian
  end
end
