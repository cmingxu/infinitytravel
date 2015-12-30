# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin bookings mrs_title:string first_name:string last_name:string preferred_contact_method:integer email:string phone:string country:string region:string postal_code:string is_subscribe:boolean user_id:integer travel_id:integer datesprice_id:integer destination_id:integer people_count:integer agent_name:string agent_code:string comment:text has_target:boolean 

class Admin::BookingsController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /bookings
  # GET /bookings.xml
  def index
    @bookings = Booking.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.xml
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.xml
  def create
    @booking = Booking.new(booking_param)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to(admin_bookings_url, :notice => 'Booking was successfully created.') }
        format.xml  { render :xml => @booking, :status => :created, :location => @booking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.xml
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(booking_param)
        format.html { redirect_to([:admin, @booking], :notice => 'Booking was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.xml
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to(admin_bookings_url) }
      format.xml  { head :ok }
    end
  end

  def booking_param
    params.require(:booking).permit!
  end
end
