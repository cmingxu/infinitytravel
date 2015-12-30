# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: cities
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  destination_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  gallery_id     :integer
#

class City < ActiveRecord::Base
	has_many :hotels
	belongs_to :destination
	belongs_to :gallery
	has_many :customizebookings
	
end
