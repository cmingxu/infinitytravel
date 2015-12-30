# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: interest_travels
#
#  id          :integer          not null, primary key
#  interest_id :integer
#  travel_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class InterestTravel < ActiveRecord::Base
	validates_presence_of :interest_id
  validates_presence_of :travel_id
  validates_uniqueness_of :travel_id, :scope => :interest_id

	belongs_to :interest
  belongs_to :travel
end
