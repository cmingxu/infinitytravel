# -*- encoding : utf-8 -*-
class SpecialoffersController < ApplicationController
  # GET /specialoffers
  # GET /specialoffers.xml
  def index
    @specialoffers = Specialoffer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specialoffers }
    end
  end

  # GET /specialoffers/1
  # GET /specialoffers/1.xml
  def show
    @specialoffer = Specialoffer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @specialoffer }
    end
  end

  # GET /specialoffers/new
  # GET /specialoffers/new.xml
  def new
    @specialoffer = Specialoffer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @specialoffer }
    end
  end

  # GET /specialoffers/1/edit
  def edit
    @specialoffer = Specialoffer.find(params[:id])
  end

  # POST /specialoffers
  # POST /specialoffers.xml
  def create
    @specialoffer = Specialoffer.new(params[:specialoffer])

    respond_to do |format|
      if @specialoffer.save
        format.html { redirect_to(@specialoffer, :notice => 'Specialoffer was successfully created.') }
        format.xml  { render :xml => @specialoffer, :status => :created, :location => @specialoffer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @specialoffer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specialoffers/1
  # PUT /specialoffers/1.xml
  def update
    @specialoffer = Specialoffer.find(params[:id])

    respond_to do |format|
      if @specialoffer.update_attributes(params[:specialoffer])
        format.html { redirect_to(@specialoffer, :notice => 'Specialoffer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @specialoffer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specialoffers/1
  # DELETE /specialoffers/1.xml
  def destroy
    @specialoffer = Specialoffer.find(params[:id])
    @specialoffer.destroy

    respond_to do |format|
      format.html { redirect_to(specialoffers_url) }
      format.xml  { head :ok }
    end
  end
end

