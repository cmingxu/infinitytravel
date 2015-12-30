# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: brochure_interests
#
#  id          :integer          not null, primary key
#  brochure_id :integer
#  interest_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class BrochureInterest < ActiveRecord::Base
	belongs_to :brochure
  belongs_to :interest
end
