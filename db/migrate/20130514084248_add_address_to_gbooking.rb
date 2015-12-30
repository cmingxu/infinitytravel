# -*- encoding : utf-8 -*-
class AddAddressToGbooking < ActiveRecord::Migration
  def self.up
    add_column :gbookings, :address, :string
    add_column :gbookings, :city, :string
  end

  def self.down
    remove_column :gbookings, :address
    remove_column :gbookings, :city
  end
end
