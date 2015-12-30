# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: gbookings
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
#  agent_name               :string(255)
#  agent_code               :string(255)
#  destination_id           :integer
#  departure_date           :datetime
#  trip_day_length          :integer
#  adult_count              :integer
#  child_count              :integer
#  event_comment            :text(65535)
#  city_comment             :text(65535)
#  created_at               :datetime
#  updated_at               :datetime
#  address                  :string(255)
#  city                     :string(255)
#

class Gbooking < ActiveRecord::Base
	belongs_to :user
	has_many :customizebookings
end
