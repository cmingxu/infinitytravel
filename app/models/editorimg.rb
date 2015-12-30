# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: editorimgs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Editorimg < ActiveRecord::Base
	mount_uploader :photo, CoverUploader
end
