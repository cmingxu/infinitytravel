# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: brochures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text(65535)
#  cover      :string(255)
#  doc        :string(255)
#  comment    :text(65535)
#  created_at :datetime
#  updated_at :datetime
#

class Brochure < ActiveRecord::Base
	has_many :brochure_travels
	has_many :travels, :through => :brochure_travels

	mount_uploader :cover, CoverUploader
	mount_uploader :doc, DocUploader
end
