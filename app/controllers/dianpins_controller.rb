# -*- encoding : utf-8 -*-
class DianpinsController < ApplicationController
  
  # GET /dianpins/1
  # GET /dianpins/1.xml
  def show
    @dianpin = Dianpin.find(params[:id])
    @travel = @dianpin.travel

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dianpin }
    end
  end


  # POST /dianpins
  # POST /dianpins.xml
  def create
    @dianpin = Dianpin.new(params[:dianpin])
    @dianpin.travel = Travel.find(params[:dianpin][:travel_id])
    @dianpin.user = current_user if current_user

    respond_to do |format|
      if @dianpin.save
        format.html { redirect_to(@dianpin, :notice => 'Dianpin was successfully created.') }
        format.xml  { render :xml => @dianpin, :status => :created, :location => @dianpin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dianpin.errors, :status => :unprocessable_entity }
      end
    end
  end

end
