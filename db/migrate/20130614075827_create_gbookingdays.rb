# -*- encoding : utf-8 -*-
class CreateGbookingdays < ActiveRecord::Migration
  def self.up
    create_table :gbookingdays do |t|
      t.integer :destination_id
      t.integer :city_id
      t.integer :hotel_id
      t.integer :days

      t.timestamps
    end
  end

  def self.down
    drop_table :gbookingdays
  end
end
