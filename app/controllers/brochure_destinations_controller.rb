# -*- encoding : utf-8 -*-
class BrochureDestinationsController < ApplicationController
  # GET /brochure_destinations
  # GET /brochure_destinations.xml
  def index
    @brochure_destinations = BrochureDestination.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brochure_destinations }
    end
  end

  # GET /brochure_destinations/1
  # GET /brochure_destinations/1.xml
  def show
    @brochure_destination = BrochureDestination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brochure_destination }
    end
  end

  # GET /brochure_destinations/new
  # GET /brochure_destinations/new.xml
  def new
    @brochure_destination = BrochureDestination.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brochure_destination }
    end
  end

  # GET /brochure_destinations/1/edit
  def edit
    @brochure_destination = BrochureDestination.find(params[:id])
  end

  # POST /brochure_destinations
  # POST /brochure_destinations.xml
  def create
    @brochure_destination = BrochureDestination.new(params[:brochure_destination])

    respond_to do |format|
      if @brochure_destination.save
        format.html { redirect_to(@brochure_destination, :notice => 'Brochure destination was successfully created.') }
        format.xml  { render :xml => @brochure_destination, :status => :created, :location => @brochure_destination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brochure_destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brochure_destinations/1
  # PUT /brochure_destinations/1.xml
  def update
    @brochure_destination = BrochureDestination.find(params[:id])

    respond_to do |format|
      if @brochure_destination.update_attributes(params[:brochure_destination])
        format.html { redirect_to(@brochure_destination, :notice => 'Brochure destination was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brochure_destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brochure_destinations/1
  # DELETE /brochure_destinations/1.xml
  def destroy
    @brochure_destination = BrochureDestination.find(params[:id])
    @brochure_destination.destroy

    respond_to do |format|
      format.html { redirect_to(brochure_destinations_url) }
      format.xml  { head :ok }
    end
  end
end
