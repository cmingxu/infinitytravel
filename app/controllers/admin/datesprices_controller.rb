# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin datesprices travel_id:integer start_date:datetime end_date:datetime prices:integer single_supplement:integer internal_airfare:integer availability_status:integer available_people_count:integer 

class Admin::DatespricesController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /datesprices
  # GET /datesprices.xml
  def index
    @travel = Travel.find(params[:travel_id])
    @datesprices = Datesprice.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datesprices }
    end
  end

  # GET /datesprices/1
  # GET /datesprices/1.xml
  def show
    @travel = Travel.find(params[:travel_id])
    @datesprice = Datesprice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datesprice }
    end
  end

  # GET /datesprices/new
  # GET /datesprices/new.xml
  def new
    @travel = Travel.find(params[:travel_id])
    @datesprice = Datesprice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datesprice }
    end
  end

  # GET /datesprices/1/edit
  def edit
    @travel = Travel.find(params[:travel_id])
    @datesprice = Datesprice.find(params[:id])
  end

  # POST /datesprices
  # POST /datesprices.xml
  def create
    @travel = Travel.find(params[:travel_id])
    @datesprice = @travel.datesprices.new(dateprice_param)

    respond_to do |format|
      if @datesprice.save
        format.html { redirect_to(admin_travel_datesprices_url, :notice => 'Datesprice was successfully created.') }
        format.xml  { render :xml => @datesprice, :status => :created, :location => @datesprice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datesprice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datesprices/1
  # PUT /datesprices/1.xml
  def update
    @travel = Travel.find(params[:travel_id])
    @datesprice = @travel.datesprices.find(params[:id])

    respond_to do |format|
      if @datesprice.update_attributes(dataprice_param)
        format.html { redirect_to([:admin, @travel, @datesprice], :notice => 'Datesprice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datesprice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datesprices/1
  # DELETE /datesprices/1.xml
  def destroy
    @datesprice = Datesprice.find(params[:id])
    @datesprice.destroy

    respond_to do |format|
      format.html { 
        if params[:travel_id]
          redirect_to(admin_travels_path) 
        else
          redirect_to(admin_datesprices_url) 
        end
      }
      format.xml  { head :ok }
    end
  end

  def dateprice_param
    params.require(:datesprice).permit!
  end
end

