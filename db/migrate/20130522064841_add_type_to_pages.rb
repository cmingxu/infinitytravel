# -*- encoding : utf-8 -*-
class AddTypeToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :type, :integer, :default => 0
  end

  def self.down
    remove_column :pages, :type
  end
end
