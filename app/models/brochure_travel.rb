# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: brochure_travels
#
#  id          :integer          not null, primary key
#  brochure_id :integer
#  travel_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class BrochureTravel < ActiveRecord::Base
	belongs_to :brochure
  belongs_to :travel
end
