# -*- encoding : utf-8 -*-
class AddCoverToTravel < ActiveRecord::Migration
  def self.up
    add_column :travels, :cover, :string
  end

  def self.down
    remove_column :travels, :cover
  end
end
