# -*- encoding : utf-8 -*-
class CreateDatesprices < ActiveRecord::Migration
  def self.up
    create_table :datesprices do |t|
      t.integer :travel_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :prices
      t.integer :single_supplement
      t.integer :internal_airfare
      t.integer :availability_status
      t.integer :available_people_count

      t.timestamps
    end
  end

  def self.down
    drop_table :datesprices
  end
end
