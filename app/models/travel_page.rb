# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: travel_pages
#
#  id         :integer          not null, primary key
#  travel_id  :integer
#  url        :string(255)
#  name       :string(255)
#  category   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TravelPage < ActiveRecord::Base
  belongs_to :travel

  validates :name, :presence => true
  validates :url, :presence => true
  validates :category, :presence => true
end
