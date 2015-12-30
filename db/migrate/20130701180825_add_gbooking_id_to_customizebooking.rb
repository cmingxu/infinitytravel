# -*- encoding : utf-8 -*-
class AddGbookingIdToCustomizebooking < ActiveRecord::Migration
  def self.up
    add_column :customizebookings, :gbooking_id, :integer
  end

  def self.down
    remove_column :customizebookings, :gbooking_id
  end
end
