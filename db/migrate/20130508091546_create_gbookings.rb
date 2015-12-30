# -*- encoding : utf-8 -*-
class CreateGbookings < ActiveRecord::Migration
  def self.up
    create_table :gbookings do |t|
      t.string :mrs_title
      t.string :first_name
      t.string :last_name
      t.integer :preferred_contact_method
      t.string :email
      t.string :phone
      t.string :country
      t.string :region
      t.string :postal_code
      t.boolean :is_subscribe
      t.integer :user_id
      t.string :agent_name
      t.string :agent_code
      t.integer :destination_id
      t.datetime :departure_date
      t.integer :trip_day_length
      t.integer :adult_count
      t.integer :child_count
      t.text :event_comment
      t.text :city_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :gbookings
  end
end
