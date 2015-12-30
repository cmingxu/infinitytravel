# -*- encoding : utf-8 -*-
class GbookingsController < ApplicationController
  

  # GET /gbookings/new
  # GET /gbookings/new.xml
  def new
    @gbooking = Gbooking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gbooking }
    end
  end


  # POST /gbookings
  # POST /gbookings.xml
  def create
    @gbooking = Gbooking.new(params.require(:gbooking).permit!)
    @gbooking.user = current_user if current_user

    respond_to do |format|
      if @gbooking.save
        format.html { redirect_to(@gbooking, :notice => 'Gbooking was successfully created.') }
        format.xml  { render :xml => @gbooking, :status => :created, :location => @gbooking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gbooking.errors, :status => :unprocessable_entity }
      end
    end
  end

end
