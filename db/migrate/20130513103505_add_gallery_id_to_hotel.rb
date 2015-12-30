# -*- encoding : utf-8 -*-
class AddGalleryIdToHotel < ActiveRecord::Migration
  def self.up
    add_column :hotels, :gallery_id, :integer
  end

  def self.down
    remove_column :hotels, :gallery_id
  end
end
