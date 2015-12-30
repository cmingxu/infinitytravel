# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin banners name:string cover:string 

class Admin::BannersController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /banners
  # GET /banners.xml
  def index
    @banners = Banner.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banners }
    end
  end

  # GET /banners/1
  # GET /banners/1.xml
  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banner }
    end
  end

  # GET /banners/new
  # GET /banners/new.xml
  def new
    @banner = Banner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banner }
    end
  end

  # GET /banners/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # POST /banners
  # POST /banners.xml
  def create
    @banner = Banner.new(banner_param)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to(admin_banners_url, :notice => 'Banner was successfully created.') }
        format.xml  { render :xml => @banner, :status => :created, :location => @banner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.xml
  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(banner_param)
        format.html { redirect_to([:admin, @banner], :notice => 'Banner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.xml
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to(admin_banners_url) }
      format.xml  { head :ok }
    end
  end

  def banner_param
    params.require(:banner).permit!
  end
end
