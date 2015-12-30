# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: datesprices
#
#  id                     :integer          not null, primary key
#  travel_id              :integer
#  start_date             :datetime
#  end_date               :datetime
#  prices                 :integer
#  single_supplement      :integer
#  internal_airfare       :integer
#  availability_status    :integer
#  available_people_count :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class Datesprice < ActiveRecord::Base
	belongs_to :travel
	has_many :bookings

	scope :by_year, lambda {|year| where("start_date >= ? and start_date <= ?", "#{year}-01-01", "#{year}-12-31")}

	def is_available?
		self.availability_status == 1 and self.available_people_count > 0
	end
end
