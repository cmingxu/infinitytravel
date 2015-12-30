# -*- encoding : utf-8 -*-
class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :provider, :string
    add_column :users, :uid, :integer
    add_column :users, :profile_url, :string
    add_column :users, :profile_image_url, :string
  end

  def self.down

    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :profile_image_url
    remove_column :users, :profile_url
  end
end
