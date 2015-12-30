# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: shouyes
#
#  id             :integer          not null, primary key
#  logo           :string(255)
#  title          :string(255)
#  phone          :string(255)
#  lianxi         :text(65535)
#  block_1_tit    :string(255)
#  block_1_cont   :text(65535)
#  block_2_pic_1  :string(255)
#  block_2_pic_2  :string(255)
#  block_2_tit    :string(255)
#  block_2_cont   :text(65535)
#  block_2_link   :string(255)
#  block_3_tit    :string(255)
#  block_3_cont   :string(255)
#  block_3_pic    :string(255)
#  block_3_link   :string(255)
#  block_4_tit    :string(255)
#  block_4_1_pic  :string(255)
#  block_4_1_tit  :string(255)
#  block_4_1_cont :text(65535)
#  block_4_1_link :string(255)
#  block_4_2_pic  :string(255)
#  block_4_2_tit  :string(255)
#  block_4_2_cont :text(65535)
#  block_4_2_link :string(255)
#  block_4_3_pic  :string(255)
#  block_4_3_tit  :string(255)
#  block_4_3_cont :text(65535)
#  block_4_3_link :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  block_5_cont   :text(65535)
#

class Shouye < ActiveRecord::Base
	mount_uploader :logo, CoverUploader
	mount_uploader :block_2_pic_1, CoverUploader
	mount_uploader :block_2_pic_2, CoverUploader
	mount_uploader :block_3_pic, CoverUploader
	mount_uploader :block_4_1_pic, CoverUploader
	mount_uploader :block_4_2_pic, CoverUploader
	mount_uploader :block_4_3_pic, CoverUploader
end
