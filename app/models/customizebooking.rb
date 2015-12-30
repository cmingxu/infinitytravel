# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: customizebookings
#
#  id             :integer          not null, primary key
#  number         :integer
#  destination_id :integer
#  city_id        :integer
#  hotel_id       :integer
#  days           :integer
#  created_at     :datetime
#  updated_at     :datetime
#  gbooking_id    :integer
#

class Customizebooking < ActiveRecord::Base
	belongs_to :gbooking
	belongs_to :destination
	belongs_to :city
	belongs_to :hotel
end
