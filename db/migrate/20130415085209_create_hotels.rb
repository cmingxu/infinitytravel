# -*- encoding : utf-8 -*-
class CreateHotels < ActiveRecord::Migration
  def self.up
    create_table :hotels do |t|
      t.string :name
      t.string :name
      t.integer :destination_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hotels
  end
end
