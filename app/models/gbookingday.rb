# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: gbookingdays
#
#  id             :integer          not null, primary key
#  destination_id :integer
#  city_id        :integer
#  hotel_id       :integer
#  days           :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Gbookingday < ActiveRecord::Base
end
