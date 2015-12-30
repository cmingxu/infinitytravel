# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin gbookings mrs_title:string first_name:string last_name:string preferred_contact_method:integer email:string phone:string country:string region:string postal_code:string is_subscribe:boolean user_id:integer agent_name:string agent_code:string destination_id:integer departure_date:datetime trip_day_length:integer adult_count:integer child_count:integer event_comment:text city_comment:text 

class Admin::GbookingsController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /gbookings
  # GET /gbookings.xml
  def index
    @gbookings = Gbooking.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gbookings }
    end
  end

  # GET /gbookings/1
  # GET /gbookings/1.xml
  def show
    @gbooking = Gbooking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gbooking }
    end
  end

  # GET /gbookings/new
  # GET /gbookings/new.xml
  def new
    @gbooking = Gbooking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gbooking }
    end
  end

  # GET /gbookings/1/edit
  def edit
    @gbooking = Gbooking.find(params[:id])
  end

  # POST /gbookings
  # POST /gbookings.xml
  def create
    @gbooking = Gbooking.new(gbooking_param)

    respond_to do |format|
      if @gbooking.save
        format.html { redirect_to(admin_gbookings_url, :notice => 'Gbooking was successfully created.') }
        format.xml  { render :xml => @gbooking, :status => :created, :location => @gbooking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gbooking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gbookings/1
  # PUT /gbookings/1.xml
  def update
    @gbooking = Gbooking.find(params[:id])

    respond_to do |format|
      if @gbooking.update_attributes(gbooking_param)
        format.html { redirect_to([:admin, @gbooking], :notice => 'Gbooking was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gbooking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gbookings/1
  # DELETE /gbookings/1.xml
  def destroy
    @gbooking = Gbooking.find(params[:id])
    @gbooking.destroy

    respond_to do |format|
      format.html { redirect_to(admin_gbookings_url) }
      format.xml  { head :ok }
    end
  end

  def gbooking_param
    params.require(:gbooking).permit!
  end
end
