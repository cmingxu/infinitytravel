# -*- encoding : utf-8 -*-
class AddGalleryIdToTravel < ActiveRecord::Migration
  def self.up
    add_column :travels, :gallery_id, :integer
  end

  def self.down
    remove_column :travels, :gallery_id
  end
end
