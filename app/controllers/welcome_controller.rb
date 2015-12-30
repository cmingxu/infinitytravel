# -*- encoding : utf-8 -*-

require "weibo"
class WelcomeController < ApplicationController
  #before_filter :authenticate_user!, :only => [:barn]

  def index
    @ishome = true
    @destinations = Destination.all
    @interests = Interest.all
    @months = Datesprice.where(["start_date > ?", Date.today]).group_by{|d| d.start_date.strftime("%Y年%m月") }
  end

  def search
    @destinations = Destination.all
    @interests = Interest.all
    @departure_dates_years = Datesprice.all.map{|d| d.start_date.strftime("%Y")}.uniq.sort
    @departure_dates = Datesprice.all.map{|d| d.start_date.strftime("%Y.%m")}.uniq.sort
    if !params[:keyword].nil? and params[:keyword] != ""
      @travels = Travel.where("name LIKE ?", "%#{params[:keyword]}%").page(params[:page])
    elsif !params[:destination].nil? and params[:destination] != "0"
      @travels = Destination.find(params[:destination]).travels.page(params[:page])
    elsif !params[:interest].nil? and params[:interest] != ""
      @travels = Interest.find(params[:interest]).travels.page(params[:page])
    elsif !params[:date].nil? and params[:date] != "0_0"
      @travels = Travel.where("name LIKE ?", "%#{params[:date]}%").page(params[:page])
    elsif !params[:price_start].nil? and params[:price_start] != "0_0"
      @travels = Travel.where("priced_from > ? and priced_from < ?", "#{params[:price_start]}","#{params[:price_end]}").page(params[:page])
    else
      @travels = Travel.page(params[:page])
    end

    if cookies[:trip_compare]
      @compare_array = cookies[:trip_compare].split(',')
    end
  end

  def compare
    compares=[]
    if cookies[:trip_compare]
      @compare_array=cookies[:trip_compare].split(',')
      (-3..-1).each do |i|
        compares.unshift(@compare_array[i]) if @compare_array[i]
      end
    end
    @compares=Travel.find(compares)
  end

  def customize_select_destination
    @destination = Destination.find(params[:id])
    @citys = @destination.cities
    render :layout => false
  end

  def customize_select_city
    @city = City.find(params[:id])
    @hotels = @city.hotels
    render :layout => false
  end

  def customize_select_hotel
    @hotel = Hotel.find(params[:id])
    render :layout => false
  end

  # weibo authentication
  def weibo_login 
    session[:quick_login] = true if params[:quick_login]
    redirect_to WeiboAuth.new.authorize_url
  end

  def weibo_callback
    begin
      auth = WeiboAuth.new
      auth.callback(params[:code])
      user_info = auth.get_user_info
      @account = User.where(:provider => 'weibo', :uid => user_info['id'].to_i).first
      # create commenter account when first weibo login
      unless @account 
        @account = User.create(:provider => 'weibo', :uid => user_info['id'], :name => user_info['screen_name'], :profile_url => user_info['profile_url'], :profile_image_url => user_info['profile_image_url'])
      end
      # update weibo profile if profile is empty
      if @account.profile_url.blank? || @account.profile_image_url.blank?
        @account.update_attributes(:profile_url => user_info['profile_url'], :profile_image_url => user_info['profile_image_url'])
      end

 
      sign_in(:user, @account)
      session[:user_id] = @account.id
      #flash[:notice] = '成功登录'
      redirect_to root_path
    rescue Exception => e
      Rails.logger.error e 
      flash[:notice] = '微博登陆失败， 检查微博账号的权限设置'
      redirect_to signup_path
    end
  end

  def get_gallery
    @gallery = Gallery.find(params[:id])
    render :layout => false
  end

  def testimg
    @banner = Editorimg.new
    @banner.name = params[:Filename]
    @banner.photo = params[:upfile]
    @banner.save
    render :text => '{"url":"'+@banner.photo.url+'", "title":"'+@banner.name+'", "state":"success"}'
  end
  # {"param2"=>"value2", "Filename"=>"images_of_indochina.jpg", "pictitle"=>"aaaa", "dir"=>"1", "param1"=>"value1", "fileName"=>"images_of_indochina.jpg", "upfile"=>#<ActionDispatch::Http::UploadedFile:0x346a778 @original_filename="images_of_indochina.jpg", @content_type="application/octet-stream", @headers="Content-Disposition: form-data; name=\"upfile\"; filename=\"images_of_indochina.jpg\"\r\nContent-Type: application/octet-stream\r\n", @tempfile=#<File:C:/DOCUME~1/ADMINI~1/LOCALS~1/Temp/RackMultipart20130703-780-cisho0>>, "Upload"=>"Submit Query", "controller"=>"welcome", "action"=>"testimg"}

  def temp
    @citys = City.all
    @citys.each do |city|
      #city.gallery = Gallery.create(:title => city.name)
      # city.save
    end
  end


  def travel_count
    @destinations = Destination.all
    @interests = Interest.all
    @departure_dates_years = Datesprice.all.map{|d| d.start_date.strftime("%Y")}.uniq.sort
    @departure_dates = Datesprice.all.map{|d| d.start_date.strftime("%Y.%m")}.uniq.sort
    if !params[:keyword].nil? and params[:keyword] != ""
      @travels = Travel.where("name LIKE ?", "%#{params[:keyword]}%").page(params[:page])
    elsif !params[:destination].nil? and params[:destination] != "0"
      @travels = Destination.find(params[:destination]).travels.page(params[:page])
    elsif !params[:interest].nil? and params[:interest] != ""
      @travels = Interest.find(params[:interest]).travels.page(params[:page])
    elsif !params[:date].nil? and params[:date] != "0_0"
      @travels = Travel.where("name LIKE ?", "%#{params[:date]}%").page(params[:page])
    elsif !params[:price_start].nil? and params[:price_start] != "0_0"
      @travels = Travel.where("priced_from > ? and priced_from <= ?", "#{params[:price_start].split('_')[0]}","#{params[:price_start].split('_')[1]}").page(params[:page])
    end

    render :inline => "<strong>#{(@travels || []).count} </strong>"
  end
end

