# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin travels name:string sub_name:string series_name:string series_cont:text priced_from:integer days_count:integer departures:integer max_group_size:integer overview_desc:text overview_advantage:text notes:text extensions_ids:text itinerary_pic:text 

class Admin::TravelsController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /travels
  # GET /travels.xml
  def index
    @travels = Travel.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @travels }
    end
  end

  # GET /travels/1
  # GET /travels/1.xml
  def show
    @travel = Travel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @travel }
    end
  end

  # GET /travels/new
  # GET /travels/new.xml
  def new
    @travel = Travel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @travel }
    end
  end

  # GET /travels/1/edit
  def edit
    @travel = Travel.find(params[:id])
  end

  # POST /travels
  # POST /travels.xml
  def create
    @travel = Travel.new(travel_param)
    @travel.gallery = Gallery.create(:title => @travel.name)

    respond_to do |format|
      if @travel.save
        format.html { redirect_to(admin_travels_url, :notice => 'Travel was successfully created.') }
        format.xml  { render :xml => @travel, :status => :created, :location => @travel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /travels/1
  # PUT /travels/1.xml
  def update
    @travel = Travel.find(params[:id])

    respond_to do |format|
      if @travel.update_attributes(travel_param)
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1
  # DELETE /travels/1.xml
  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy

    respond_to do |format|
      format.html { redirect_to(admin_travels_url) }
      format.xml  { head :ok }
    end
  end

  # 绑定相关地区
  def new_destination_travel
    @travel = Travel.find(params[:id])
  end

  def create_destination_travel
    @travel = Travel.find(params[:id])
    @destination = Destination.find(params[:destination_id])
    @travel.destinations << @destination

    respond_to do |format|
      if @travel.save
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "new_destination_travel" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy_destination_travel
    @travel = Travel.find(params[:id])
    @destination = Destination.find(params[:destination_id])
    

    respond_to do |format|
      if DestinationTravel.where("travel_id = ? AND destination_id = ?", @travel.id , @destination.id ).destroy_all
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      end
    end
  end

  #绑定相关兴趣点
  def new_interest_travel
    @travel = Travel.find(params[:id])
  end

  def create_interest_travel
    @travel = Travel.find(params[:id])
    @interest = Interest.find(params[:interest_id])
    @travel.interests << @interest

    respond_to do |format|
      if @travel.save
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "new_interest_travel" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy_interest_travel
    @travel = Travel.find(params[:id])
    @interest = Interest.find(params[:interest_id])
    

    respond_to do |format|
      if InterestTravel.where("travel_id = ? AND interest_id = ?", @travel.id , @interest.id ).destroy_all
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      end
    end
  end

  #绑定相关优惠信息
  def new_specialoffer_travel
    @travel = Travel.find(params[:id])
  end

  def create_specialoffer_travel
    @travel = Travel.find(params[:id])
    @specialoffer = Specialoffer.find(params[:specialoffer_id])
    @travel.specialoffers << @specialoffer

    respond_to do |format|
      if @travel.save
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "new_specialoffer_travel" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy_specialoffer_travel
    @travel = Travel.find(params[:id])
    @specialoffer = Specialoffer.find(params[:specialoffer_id])
    

    respond_to do |format|
      if SpecialofferTravel.where("travel_id = ? AND specialoffer_id = ?", @travel.id , @specialoffer.id ).destroy_all
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      end
    end
  end

  #绑定相关PDF
  def new_brochure_travel
    @travel = Travel.find(params[:id])
  end

  def create_brochure_travel
    @travel = Travel.find(params[:id])
    @brochure = Brochure.find(params[:brochure_id])
    @travel.brochures << @brochure

    respond_to do |format|
      if @travel.save
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "new_brochure_travel" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy_brochure_travel
    @travel = Travel.find(params[:id])
    @brochure = Brochure.find(params[:brochure_id])
    

    respond_to do |format|
      if BrochureTravel.where("travel_id = ? AND brochure_id = ?", @travel.id , @brochure.id ).destroy_all
        format.html { redirect_to([:admin, @travel], :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      end
    end
  end

  def travel_param
    params.require(:travel).permit!
  end
end

