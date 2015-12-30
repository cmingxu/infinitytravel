# -*- encoding : utf-8 -*-
class CreateDestinationTravels < ActiveRecord::Migration
  def self.up
    create_table :destination_travels do |t|
      t.integer :destination_id
      t.integer :travel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :destination_travels
  end
end
