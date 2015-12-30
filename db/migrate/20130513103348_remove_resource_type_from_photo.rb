# -*- encoding : utf-8 -*-
class RemoveResourceTypeFromPhoto < ActiveRecord::Migration
  def self.up
    remove_column :photos, :resource_type
    remove_column :photos, :resource_id
  end

  def self.down
    add_column :photos, :resource_type, :string
    add_column :photos, :resource_id, :integer
  end
end
