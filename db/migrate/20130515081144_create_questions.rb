# -*- encoding : utf-8 -*-
class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :mrs_title
      t.string :first_name
      t.string :last_name
      t.integer :preferred_contact_method
      t.string :email
      t.string :phone
      t.string :country
      t.text :question
      t.integer :travel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
