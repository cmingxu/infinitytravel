# -*- encoding : utf-8 -*-
class CreateBrochureDestinations < ActiveRecord::Migration
  def self.up
    create_table :brochure_destinations do |t|
      t.integer :brochure_id
      t.integer :destination_id

      t.timestamps
    end
  end

  def self.down
    drop_table :brochure_destinations
  end
end
