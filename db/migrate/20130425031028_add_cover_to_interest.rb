# -*- encoding : utf-8 -*-
class AddCoverToInterest < ActiveRecord::Migration
  def self.up
    add_column :interests, :cover, :string
  end

  def self.down
    remove_column :interests, :cover
  end
end
