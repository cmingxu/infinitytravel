# -*- encoding : utf-8 -*-
class AddSomeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :login, :string
    add_column :users, :home_phone, :string
    add_column :users, :cellphone, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :region, :string
    add_column :users, :country, :string
    add_column :users, :postal_code, :string
    add_column :users, :has_past, :boolean
    add_column :users, :title, :string
    add_column :users, :birth_date, :datetime
  end

  def self.down
    remove_column :users, :birth_date
    remove_column :users, :title
    remove_column :users, :has_past
    remove_column :users, :postal_code
    remove_column :users, :country
    remove_column :users, :region
    remove_column :users, :city
    remove_column :users, :address
    remove_column :users, :cellphone
    remove_column :users, :home_phone
    remove_column :users, :login
    remove_column :users, :name
  end
end
