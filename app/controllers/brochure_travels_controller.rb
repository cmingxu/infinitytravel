# -*- encoding : utf-8 -*-
class BrochureTravelsController < ApplicationController
  # GET /brochure_travels
  # GET /brochure_travels.xml
  def index
    @brochure_travels = BrochureTravel.all

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
        format.html { redirect_to(@brochure_travel, :notice => 'Brochure travel was successfully created.') }
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
        format.html { redirect_to(@brochure_travel, :notice => 'Brochure travel was successfully updated.') }
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
      format.html { redirect_to(brochure_travels_url) }
      format.xml  { head :ok }
    end
  end
end
