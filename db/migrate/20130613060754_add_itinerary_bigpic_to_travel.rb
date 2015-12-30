# -*- encoding : utf-8 -*-
class AddItineraryBigpicToTravel < ActiveRecord::Migration
  def self.up
    add_column :travels, :itinerary_bigpic, :text
  end

  def self.down
    remove_column :travels, :itinerary_bigpic
  end
end
