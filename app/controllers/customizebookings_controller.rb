# -*- encoding : utf-8 -*-
class CustomizebookingsController < ApplicationController
  # GET /customizebookings
  # GET /customizebookings.xml
  def index
    @customizebookings = Customizebooking.all
    @destinations = Destination.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customizebookings }
    end
  end

  # GET /customizebookings/1
  # GET /customizebookings/1.xml
  def show
    @customizebooking = Customizebooking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customizebooking }
    end
  end

  # GET /customizebookings/new
  # GET /customizebookings/new.xml
  def new
    @customizebooking = Customizebooking.new
    @destinations = Destination.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customizebooking }
    end
  end

  # GET /customizebookings/1/edit
  def edit
    @customizebooking = Customizebooking.find(params[:id])
  end

  # POST /customizebookings
  # POST /customizebookings.xml
  def create
    @gbooking = Gbooking.new(gbooking_params)
    @gbooking.user = current_user if current_user
    if @gbooking.save
      params[:customizebookings].each_with_index do |customizebooking,index|
        customizebooking.permit!
        @customizebooking = Customizebooking.new(customizebooking.permit!)
        @customizebooking.number = index + 1
        @customizebooking.gbooking = @gbooking
        @customizebooking.save
      end

      respond_to do |format|
        format.html { redirect_to(@gbooking, :notice => 'Customizebooking was successfully created.') }
        format.xml  { render :xml => @customizebooking, :status => :created, :location => @customizebooking }
      end
    end
  end

  # PUT /customizebookings/1
  # PUT /customizebookings/1.xml
  def update
    @customizebooking = Customizebooking.find(params[:id])

    respond_to do |format|
      if @customizebooking.update_attributes(params[:customizebooking])
        format.html { redirect_to(@customizebooking, :notice => 'Customizebooking was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customizebooking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customizebookings/1
  # DELETE /customizebookings/1.xml
  def destroy
    @customizebooking = Customizebooking.find(params[:id])
    @customizebooking.destroy

    respond_to do |format|
      format.html { redirect_to(customizebookings_url) }
      format.xml  { head :ok }
    end
  end

  def gbooking_params
    params.require(:gbooking).permit!
  end
end
