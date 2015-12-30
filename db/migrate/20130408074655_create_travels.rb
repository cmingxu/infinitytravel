# -*- encoding : utf-8 -*-
class CreateTravels < ActiveRecord::Migration
  def self.up
    create_table :travels do |t|
      t.string :name
      t.string :sub_name
      t.string :series_name
      t.text :series_cont
      t.integer :priced_from
      t.integer :days_count
      t.integer :departures
      t.integer :max_group_size
      t.text :overview_desc
      t.text :overview_advantage
      t.text :notes
      t.text :extensions_ids
      t.text :itinerary_pic

      t.timestamps
    end
  end

  def self.down
    drop_table :travels
  end
end
