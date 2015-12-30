# -*- encoding : utf-8 -*-
class CreateSpecialoffers < ActiveRecord::Migration
  def self.up
    create_table :specialoffers do |t|
      t.string :title
      t.text :desc
      t.text :cont
      t.string :pic

      t.timestamps
    end
  end

  def self.down
    drop_table :specialoffers
  end
end
