# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: itineraries
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  desc          :text(65535)
#  travel_id     :integer
#  sort          :integer
#  hotel_id      :integer
#  meals         :string(255)
#  start_day_num :integer
#  end_day_num   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  hotel_id2     :integer
#  hotel_id3     :integer
#  hotel_id4     :integer
#  hotel_id5     :integer
#

class Itinerary < ActiveRecord::Base
	belongs_to :travel
	belongs_to :hotel
	default_scope -> { order('sort ASC') }
end
