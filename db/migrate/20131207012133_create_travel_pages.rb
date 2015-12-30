# -*- encoding : utf-8 -*-
class CreateTravelPages < ActiveRecord::Migration
  def self.up
    create_table :travel_pages do |t|
      t.integer :travel_id
      t.string :url
      t.string :name
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :travel_pages
  end
end
