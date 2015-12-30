# -*- encoding : utf-8 -*-
class AddImgnameToBanner < ActiveRecord::Migration
  def self.up
    add_column :banners, :imgname, :string
  end

  def self.down
    remove_column :banners, :imgname
  end
end
