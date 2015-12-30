# -*- encoding : utf-8 -*-
class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @datesprice = @booking.datesprice
    @travel = @booking.travel
    @people_count = @booking.people_count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    @booking = Booking.new
    @datesprice = Datesprice.find(params[:datesprice_id])
    @travel = @datesprice.travel
    @people_count = params[:people_count].to_i

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @booking }
    end
  end
 

  # POST /bookings
  # POST /bookings.xml
  def create
    @booking = Booking.new(params[:booking])
    @booking.user = current_user if current_user

    respond_to do |format|
      if @booking.save
        format.html { redirect_to(@booking, :notice => 'Booking was successfully created.') }
        format.xml  { render :xml => @booking, :status => :created, :location => @booking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

end
