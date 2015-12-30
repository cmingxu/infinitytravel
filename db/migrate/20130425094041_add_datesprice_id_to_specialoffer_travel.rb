# -*- encoding : utf-8 -*-
class AddDatespriceIdToSpecialofferTravel < ActiveRecord::Migration
  def self.up
    add_column :specialoffer_travels, :datesprice_id, :integer
  end

  def self.down
    remove_column :specialoffer_travels, :datesprice_id
  end
end
