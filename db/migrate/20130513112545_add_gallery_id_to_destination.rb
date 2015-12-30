# -*- encoding : utf-8 -*-
class AddGalleryIdToDestination < ActiveRecord::Migration
  def self.up
    add_column :destinations, :gallery_id, :integer
  end

  def self.down
    remove_column :destinations, :gallery_id
  end
end
