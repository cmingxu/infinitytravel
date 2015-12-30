# -*- encoding : utf-8 -*-
class CreatePhotocontests < ActiveRecord::Migration
  def self.up
    create_table :photocontests do |t|
      t.string :username
      t.string :name
      t.string :desc
      t.string :photo

      t.timestamps
    end
  end

  def self.down
    drop_table :photocontests
  end
end
