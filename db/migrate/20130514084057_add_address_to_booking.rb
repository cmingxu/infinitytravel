# -*- encoding : utf-8 -*-
class AddAddressToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :address, :string
    add_column :bookings, :city, :string
  end

  def self.down
    remove_column :bookings, :address
    remove_column :bookings, :city
  end
end
