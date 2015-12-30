# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  cont       :text(65535)
#  created_at :datetime
#  updated_at :datetime
#  page_type  :integer          default(0)
#

class Page < ActiveRecord::Base
end
