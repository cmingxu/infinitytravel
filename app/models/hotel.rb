# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: hotels
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  destination_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  gallery_id     :integer
#  city_id        :integer
#

class Hotel < ActiveRecord::Base
	belongs_to :gallery
	belongs_to :destination
	belongs_to :city
	has_many :itinerary
	has_many :customizebookings
end
