# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  cont       :text(65535)
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  cover      :string(255)
#

class Interest < ActiveRecord::Base
	has_ancestry
	
	has_many :interest_travels
	has_many :travels, :through => :interest_travels

	has_many :brochure_interests
	has_many :brochures, :through => :brochure_interests

	# 上传
	mount_uploader :cover, CoverUploader
end
