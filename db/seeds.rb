# -*- encoding : utf-8 -*-
ADMINS = %w{ insub@126.com xxx@gmail.com cming.xu@gmail.com }

ADMINS.each do |email|
  User.create!(:email => email, :password => "admin01", :password_confirmation => "admin01")
end


