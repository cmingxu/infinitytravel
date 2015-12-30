# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(128)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  login                  :string(255)
#  home_phone             :string(255)
#  cellphone              :string(255)
#  address                :string(255)
#  city                   :string(255)
#  region                 :string(255)
#  country                :string(255)
#  postal_code            :string(255)
#  has_past               :boolean
#  title                  :string(255)
#  birth_date             :datetime
#  travel_agent           :string(255)
#  travel_agent_code      :string(255)
#  provider               :string(255)
#  uid                    :integer
#  profile_url            :string(255)
#  profile_image_url      :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # 基本数据库
    #:token_authenticatable, # 
    #:omniauthable, # 社会化登录
    #:timeoutable, #
    :registerable, # 注册
    :recoverable, # 找回密码
    :rememberable, # Remember
    :trackable, # 用户登录IP等追踪记录
    :validatable # 校验字段
  #:lockable#, # 禁用解锁用户
  #:confirmable # 再次（邮件激活）确认才可登录

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me

  validates_presence_of :email
  validates_uniqueness_of :email

  validates :password, :presence =>true, :confirmation => true, :length => { :within => 6..40 },:on => :create
  validates :password, :confirmation => true, :length => { :within => 6..40 }, :unless => lambda{ |user| user.password.nil? }, :on => :update
  # 定义用户名和email的格式
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  has_many :bookings
  has_many :gbookings
  has_many :questions
  has_many :dianpins

  def identity
    self.name || self.login || self.email 
  end

  #def after_database_authentication
  #当用户成功登录后会执行此处代码，另有登录后到那个路径的方法
  #end

  # 是否是管理员
  def admin?
    Setting.admin_emails.include?(self.email)
  end

end
