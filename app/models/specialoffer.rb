# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: specialoffers
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  desc       :text(65535)
#  cont       :text(65535)
#  created_at :datetime
#  updated_at :datetime
#  cover      :string(255)
#

class Specialoffer < ActiveRecord::Base
	has_many :specialoffer_travels
	has_many :travels, :through => :specialoffer_travels

	# 上传
	mount_uploader :cover, CoverUploader
end
