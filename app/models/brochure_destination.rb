# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: brochure_destinations
#
#  id             :integer          not null, primary key
#  brochure_id    :integer
#  destination_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class BrochureDestination < ActiveRecord::Base
	belongs_to :brochure
  belongs_to :destination
end
