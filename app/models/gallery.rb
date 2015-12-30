# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  travel_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Gallery < ActiveRecord::Base
	has_many :photos

	has_many :hotels
	has_many :destinations
	has_many :cities
	has_many :travels
end
