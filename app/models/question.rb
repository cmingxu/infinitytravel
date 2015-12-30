# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: questions
#
#  id                       :integer          not null, primary key
#  mrs_title                :string(255)
#  first_name               :string(255)
#  last_name                :string(255)
#  preferred_contact_method :integer
#  email                    :string(255)
#  phone                    :string(255)
#  country                  :string(255)
#  question                 :text(65535)
#  travel_id                :integer
#  created_at               :datetime
#  updated_at               :datetime
#  user_id                  :integer
#

class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :travel
end
