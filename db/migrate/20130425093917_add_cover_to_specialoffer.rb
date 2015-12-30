# -*- encoding : utf-8 -*-
class AddCoverToSpecialoffer < ActiveRecord::Migration
  def self.up
    add_column :specialoffers, :cover, :string
  end

  def self.down
    remove_column :specialoffers, :cover
  end
end
