# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: specialoffer_travels
#
#  id              :integer          not null, primary key
#  specialoffer_id :integer
#  travel_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#  datesprice_id   :integer
#

class SpecialofferTravel < ActiveRecord::Base
	validates_presence_of :specialoffer_id
  validates_presence_of :travel_id
  validates_uniqueness_of :travel_id, :scope => :specialoffer_id

	belongs_to :specialoffer
  belongs_to :travel
end
