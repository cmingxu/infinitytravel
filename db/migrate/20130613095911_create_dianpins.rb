# -*- encoding : utf-8 -*-
class CreateDianpins < ActiveRecord::Migration
  def self.up
    create_table :dianpins do |t|
      t.string :name
      t.text :cont
      t.string :travel_code
      t.integer :travel_id
      t.integer :user_id
      t.boolean :is_show

      t.timestamps
    end
  end

  def self.down
    drop_table :dianpins
  end
end
