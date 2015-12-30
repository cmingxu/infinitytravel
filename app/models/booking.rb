# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: bookings
#
#  id                       :integer          not null, primary key
#  mrs_title                :string(255)
#  first_name               :string(255)
#  last_name                :string(255)
#  preferred_contact_method :integer
#  email                    :string(255)
#  phone                    :string(255)
#  country                  :string(255)
#  region                   :string(255)
#  postal_code              :string(255)
#  is_subscribe             :boolean
#  user_id                  :integer
#  travel_id                :integer
#  datesprice_id            :integer
#  destination_id           :integer
#  people_count             :integer
#  agent_name               :string(255)
#  agent_code               :string(255)
#  comment                  :text(65535)
#  has_target               :boolean
#  created_at               :datetime
#  updated_at               :datetime
#  address                  :string(255)
#  city                     :string(255)
#

class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :travel
	belongs_to :datesprice

end
