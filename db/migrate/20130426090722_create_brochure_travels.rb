# -*- encoding : utf-8 -*-
class CreateBrochureTravels < ActiveRecord::Migration
  def self.up
    create_table :brochure_travels do |t|
      t.integer :brochure_id
      t.integer :travel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :brochure_travels
  end
end
