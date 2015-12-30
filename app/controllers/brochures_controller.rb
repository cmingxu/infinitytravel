# -*- encoding : utf-8 -*-
class BrochuresController < ApplicationController
  # GET /brochures
  # GET /brochures.xml
  def index
    @brochures = Brochure.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brochures }
    end
  end

  # GET /brochures/1
  # GET /brochures/1.xml
  def show
    @brochure = Brochure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brochure }
    end
  end

end
