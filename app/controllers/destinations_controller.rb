# -*- encoding : utf-8 -*-
class DestinationsController < ApplicationController
  # GET /destinations
  # GET /destinations.xml
  def index
    @destinations = Destination.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.xml
  def show
    @destinations = Destination.all
    @destination = Destination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @destination }
    end
  end
  
end

