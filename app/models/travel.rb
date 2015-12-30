# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: travels
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  sub_name           :string(255)
#  priced_from        :integer
#  days_count         :integer
#  departures         :integer
#  max_group_size     :integer
#  overview_desc      :text(65535)
#  overview_advantage :text(65535)
#  notes              :text(65535)
#  extensions_ids     :text(65535)
#  itinerary_pic      :text(65535)
#  created_at         :datetime
#  updated_at         :datetime
#  cover              :string(255)
#  itinerary_bigpic   :text(65535)
#  desc_mappic        :text(65535)
#  gallery_id         :integer
#  jindian            :text(65535)
#  travel_type        :string(255)
#  position           :integer
#

class Travel < ActiveRecord::Base

	has_many :itineraries
	has_many :datesprices

	has_many :destination_travels
	has_many :destinations, :through => :destination_travels

	has_many :interest_travels
	has_many :interests, :through => :interest_travels

	has_many :specialoffer_travels
	has_many :specialoffers, :through => :specialoffer_travels

	has_many :brochure_travels
	has_many :brochures, :through => :brochure_travels

	has_many :bookings, :dependent => :destroy
	has_many :questions, :dependent => :destroy
	has_many :dianpins, :dependent => :destroy

	belongs_to :gallery

  has_many :travel_pages

	# 上传
	mount_uploader :cover, CoverUploader
	mount_uploader :desc_mappic, CoverUploader
	mount_uploader :itinerary_pic, CoverUploader
	mount_uploader :itinerary_bigpic, CoverUploader


  def travel_type_icon
    case self.travel_type
    when condition
    end
  end

  def interest_icon
    iname = self.interests.first.title
    (["奢华小众游", "经典团队游", "私家订制游", "邮轮旅游", "非洲游猎", "求婚&蜜月", "心灵疗养", "亲子假期", "居游"].index(iname) || 0) + 1
  end
end
