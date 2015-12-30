# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: destinations
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  desc_title          :string(255)
#  desc                :text(65535)
#  banner_pic          :string(255)
#  map_pic             :string(255)
#  flights             :text(65535)
#  timezone            :string(255)
#  climate             :text(65535)
#  health_requirements :text(65535)
#  voltage             :text(65535)
#  currency            :text(65535)
#  created_at          :datetime
#  updated_at          :datetime
#  ancestry            :string(255)
#  gallery_id          :integer
#  flashmap            :string(255)
#

class Destination < ActiveRecord::Base
	has_ancestry
	has_many :destination_travels
	has_many :travels, :through => :destination_travels

	has_many :brochure_destinations
	has_many :brochures, :through => :brochure_destinations
	has_many :cities
	has_many :customizebookings

	
	belongs_to :gallery

end
