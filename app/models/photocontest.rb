# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: photocontests
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  name       :string(255)
#  desc       :string(255)
#  photo      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Photocontest < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
end
