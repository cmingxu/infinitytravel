# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  cont       :text(65535)
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
end
