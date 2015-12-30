# -*- encoding : utf-8 -*-
class AddGalleryIdToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :gallery_id, :integer
  end

  def self.down
    remove_column :cities, :gallery_id
  end
end
