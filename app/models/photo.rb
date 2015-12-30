# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  sort       :integer
#  pic        :string(255)
#  desc       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  gallery_id :integer
#

class Photo < ActiveRecord::Base
	mount_uploader :pic, PhotoUploader
	belongs_to :gallery
end
