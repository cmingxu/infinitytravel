# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: dianpins
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cont        :text(65535)
#  travel_code :string(255)
#  travel_id   :integer
#  user_id     :integer
#  is_show     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Dianpin < ActiveRecord::Base
	belongs_to :user
	belongs_to :travel
end
