# -*- encoding : utf-8 -*-
class CreateItineraries < ActiveRecord::Migration
  def self.up
    create_table :itineraries do |t|
      t.string :name
      t.text :desc
      t.integer :travel_id
      t.integer :sort
      t.integer :hotel_id
      t.string :meals
      t.integer :start_day_num
      t.integer :end_day_num

      t.timestamps
    end
  end

  def self.down
    drop_table :itineraries
  end
end
