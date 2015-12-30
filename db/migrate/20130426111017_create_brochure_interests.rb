# -*- encoding : utf-8 -*-
class CreateBrochureInterests < ActiveRecord::Migration
  def self.up
    create_table :brochure_interests do |t|
      t.integer :brochure_id
      t.integer :interest_id

      t.timestamps
    end
  end

  def self.down
    drop_table :brochure_interests
  end
end
