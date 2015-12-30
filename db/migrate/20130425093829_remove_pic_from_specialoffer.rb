# -*- encoding : utf-8 -*-
class RemovePicFromSpecialoffer < ActiveRecord::Migration
  def self.up
    remove_column :specialoffers, :pic
  end

  def self.down
    add_column :specialoffers, :pic, :string
  end
end
