# -*- encoding : utf-8 -*-
class CreateCustomizebookings < ActiveRecord::Migration
  def self.up
    create_table :customizebookings do |t|
      t.integer :number
      t.integer :destination_id
      t.integer :city_id
      t.integer :hotel_id
      t.integer :days

      t.timestamps
    end
  end

  def self.down
    drop_table :customizebookings
  end
end
