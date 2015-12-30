# -*- encoding : utf-8 -*-
class AddDescMappicToTravel < ActiveRecord::Migration
  def self.up
    add_column :travels, :desc_mappic, :text
  end

  def self.down
    remove_column :travels, :desc_mappic
  end
end
