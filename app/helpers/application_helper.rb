# -*- encoding : utf-8 -*-
module ApplicationHelper
	def admin?(user = nil)
    user ||= current_user
    user.try(:admin?)
  end

  def placeholder(width, height, options = {})
    "http://placehold.it/#{width}x#{height}&#{options.to_query}"
  end
end

