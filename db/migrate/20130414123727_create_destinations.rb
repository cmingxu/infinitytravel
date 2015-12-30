# -*- encoding : utf-8 -*-
class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.string :name
      t.string :desc_title
      t.text :desc
      t.string :banner_pic
      t.string :map_pic
      t.text :flights
      t.string :timezone
      t.text :climate
      t.text :health_requirements
      t.text :voltage
      t.text :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
