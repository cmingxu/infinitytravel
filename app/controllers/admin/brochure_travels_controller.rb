# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin brochure_travels brochure_id:integer travel_id:integer 

class Admin::BrochureTravelsController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /brochure_travels
  # GET /brochure_travels.xml
  def index
    @brochure_travels = BrochureTravel.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brochure_travels }
    end
  end

  # GET /brochure_travels/1
  # GET /brochure_travels/1.xml
  def show
    @brochure_travel = BrochureTravel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brochure_travel }
    end
  end

  # GET /brochure_travels/new
  # GET /brochure_travels/new.xml
  def new
    @brochure_travel = BrochureTravel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brochure_travel }
    end
  end

  # GET /brochure_travels/1/edit
  def edit
    @brochure_travel = BrochureTravel.find(params[:id])
  end

  # POST /brochure_travels
  # POST /brochure_travels.xml
  def create
    @brochure_travel = BrochureTravel.new(params[:brochure_travel])

    respond_to do |format|
      if @brochure_travel.save
        format.html { redirect_to(admin_brochure_travels_url, :notice => 'Brochure travel was successfully created.') }
        format.xml  { render :xml => @brochure_travel, :status => :created, :location => @brochure_travel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brochure_travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brochure_travels/1
  # PUT /brochure_travels/1.xml
  def update
    @brochure_travel = BrochureTravel.find(params[:id])

    respond_to do |format|
      if @brochure_travel.update_attributes(params[:brochure_travel])
        format.html { redirect_to([:admin, @brochure_travel], :notice => 'Brochure travel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brochure_travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brochure_travels/1
  # DELETE /brochure_travels/1.xml
  def destroy
    @brochure_travel = BrochureTravel.find(params[:id])
    @brochure_travel.destroy

    respond_to do |format|
      format.html { redirect_to(admin_brochure_travels_url) }
      format.xml  { head :ok }
    end
  end
end
