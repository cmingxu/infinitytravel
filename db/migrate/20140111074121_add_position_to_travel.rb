class AddPositionToTravel < ActiveRecord::Migration
  def self.up
    add_column :travels, :position, :integer
  end

  def self.down
    remove_column :travels, :position
  end
end
