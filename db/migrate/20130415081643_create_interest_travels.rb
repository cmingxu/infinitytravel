# -*- encoding : utf-8 -*-
class CreateInterestTravels < ActiveRecord::Migration
  def self.up
    create_table :interest_travels do |t|
      t.integer :interest_id
      t.integer :travel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :interest_travels
  end
end
