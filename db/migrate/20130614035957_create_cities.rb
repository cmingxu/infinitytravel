# -*- encoding : utf-8 -*-
class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name
      t.integer :destination_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
