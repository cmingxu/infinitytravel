# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin gbookingdays destination_id:integer city_id:integer hotel_id:integer days:integer 

class Admin::GbookingdaysController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /gbookingdays
  # GET /gbookingdays.xml
  def index
    @gbookingdays = Gbookingday.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gbookingdays }
    end
  end

  # GET /gbookingdays/1
  # GET /gbookingdays/1.xml
  def show
    @gbookingday = Gbookingday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gbookingday }
    end
  end

  # GET /gbookingdays/new
  # GET /gbookingdays/new.xml
  def new
    @gbookingday = Gbookingday.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gbookingday }
    end
  end

  # GET /gbookingdays/1/edit
  def edit
    @gbookingday = Gbookingday.find(params[:id])
  end

  # POST /gbookingdays
  # POST /gbookingdays.xml
  def create
    @gbookingday = Gbookingday.new(params[:gbookingday])

    respond_to do |format|
      if @gbookingday.save
        format.html { redirect_to(admin_gbookingdays_url, :notice => 'Gbookingday was successfully created.') }
        format.xml  { render :xml => @gbookingday, :status => :created, :location => @gbookingday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gbookingday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gbookingdays/1
  # PUT /gbookingdays/1.xml
  def update
    @gbookingday = Gbookingday.find(params[:id])

    respond_to do |format|
      if @gbookingday.update_attributes(params[:gbookingday])
        format.html { redirect_to([:admin, @gbookingday], :notice => 'Gbookingday was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gbookingday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gbookingdays/1
  # DELETE /gbookingdays/1.xml
  def destroy
    @gbookingday = Gbookingday.find(params[:id])
    @gbookingday.destroy

    respond_to do |format|
      format.html { redirect_to(admin_gbookingdays_url) }
      format.xml  { head :ok }
    end
  end
end
