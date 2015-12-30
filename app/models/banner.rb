# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: banners
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  cover          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  imgname        :string(255)
#  link           :string(255)
#  destination_id :integer
#  travel_id      :integer
#

class Banner < ActiveRecord::Base
	mount_uploader :cover, CoverUploader
end
