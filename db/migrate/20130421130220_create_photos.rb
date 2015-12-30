# -*- encoding : utf-8 -*-
class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :sort
      t.string :pic
      t.string :desc
      t.string :resource_type
      t.integer :resource_id

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
