# -*- encoding : utf-8 -*-
class AddTravelTypeForTravels < ActiveRecord::Migration
  def self.up
    add_column :travels, :travel_type, :string
  end

  def self.down
    remove_column :travels, :travel_type
  end
end
