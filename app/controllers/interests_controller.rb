# -*- encoding : utf-8 -*-
class InterestsController < ApplicationController
  # GET /interests
  # GET /interests.xml
  def index
    @interests = Interest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interests }
    end
  end

  # GET /interests/1
  # GET /interests/1.xml
  def show
    @interest = Interest.find(params[:id])
    @interests = Interest.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interest }
    end
  end

end

