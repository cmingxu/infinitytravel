# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin customizebookings number:integer destination_id:integer city_id:integer hotel_id:integer days:integer 

class Admin::CustomizebookingsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /customizebookings
  # GET /customizebookings.xml
  def index
    @customizebookings = Customizebooking.order("updated_at DESC").page(params[:page])

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
    @customizebooking = Customizebooking.new(params[:customizebooking])

    respond_to do |format|
      if @customizebooking.save
        format.html { redirect_to(admin_customizebookings_url, :notice => 'Customizebooking was successfully created.') }
        format.xml  { render :xml => @customizebooking, :status => :created, :location => @customizebooking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customizebooking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customizebookings/1
  # PUT /customizebookings/1.xml
  def update
    @customizebooking = Customizebooking.find(params[:id])

    respond_to do |format|
      if @customizebooking.update_attributes(params[:customizebooking])
        format.html { redirect_to([:admin, @customizebooking], :notice => 'Customizebooking was successfully updated.') }
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
      format.html { redirect_to(admin_customizebookings_url) }
      format.xml  { head :ok }
    end
  end
end
