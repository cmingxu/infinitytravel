# -*- encoding : utf-8 -*-
class RemoveSeriesNameFromTravel < ActiveRecord::Migration
  def self.up
    remove_column :travels, :series_name
    remove_column :travels, :series_cont
  end

  def self.down
    add_column :travels, :series_cont, :text
    add_column :travels, :series_name, :string
  end
end
