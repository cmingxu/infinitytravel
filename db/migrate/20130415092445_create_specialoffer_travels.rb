# -*- encoding : utf-8 -*-
class CreateSpecialofferTravels < ActiveRecord::Migration
  def self.up
    create_table :specialoffer_travels do |t|
      t.integer :specialoffer_id
      t.integer :travel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :specialoffer_travels
  end
end
