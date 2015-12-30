# -*- encoding : utf-8 -*-
class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
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
      t.integer :travel_id
      t.integer :datesprice_id
      t.integer :destination_id
      t.integer :people_count
      t.string :agent_name
      t.string :agent_code
      t.text :comment
      t.boolean :has_target

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
