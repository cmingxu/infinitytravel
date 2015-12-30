# -*- encoding : utf-8 -*-
class AddTravelAgentToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :travel_agent, :string
    add_column :users, :travel_agent_code, :string
  end

  def self.down
    remove_column :users, :travel_code
    remove_column :users, :travel_agent_code
  end
end
