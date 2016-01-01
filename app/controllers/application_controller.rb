# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  def require_admin
    redirect_to "/login" unless current_user && Setting.admin_emails.include?(current_user.email)
  end
end

