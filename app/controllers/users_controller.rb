class UsersController < ApplicationController

  def show # 作为自己的主页
    @user = User.find_by_id(params[:id])
    @bookings = @user.bookings.all
  end

  def setting
    @user = User.find(current_user.id)
  end

  def update_setting
    @user = User.find(current_user.id)
    @user.localtion = params[:user][:localtion] #不允许修改用户名

    if @user.save
      redirect_to :action => "setting"
    else
      render :action => "setting", :error => '出错.'
    end
  end

  def update_password
    @user = User.find(current_user.id)
    @params = {:current_password => params[:user][:current_password],:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]}

    # 如果当前密码正确并且修改后密码不等于空
    if @user.update_with_password(@params) && !params[:user][:password].blank?
      redirect_to(:new_user_session)
    else
      render :action => "setting"
    end
  end

  def update_avatar
    @user = User.find(current_user.id)
    @user.avatar = params[:user][:avatar]
    if @user.save
      redirect_to :action => "setting"
    else
      render :action => "setting", :error => '出错.'
    end
  end

  def dianpins
    @dianpins = current_user.dianpins
  end

  def bookings
    @bookings = current_user.bookings
    @gbookings = current_user.gbookings
  end

  def questions
    @questions = current_user.questions
  end

end

