# -*- encoding : utf-8 -*-
class AddBlockToShouye < ActiveRecord::Migration
  def self.up
    add_column :shouyes, :block_5_cont, :text
  end

  def self.down
    remove_column :shouyes, :block_5_cont
  end
end
