# -*- encoding : utf-8 -*-
class DatespricesController < ApplicationController
  # GET /datesprices
  # GET /datesprices.xml
  def index
    @datesprices = Datesprice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datesprices }
    end
  end

  # GET /datesprices/1
  # GET /datesprices/1.xml
  def show
    @datesprice = Datesprice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datesprice }
    end
  end

  # GET /datesprices/new
  # GET /datesprices/new.xml
  def new
    @datesprice = Datesprice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datesprice }
    end
  end

  # GET /datesprices/1/edit
  def edit
    @datesprice = Datesprice.find(params[:id])
  end

  # POST /datesprices
  # POST /datesprices.xml
  def create
    @datesprice = Datesprice.new(params[:datesprice])

    respond_to do |format|
      if @datesprice.save
        format.html { redirect_to(@datesprice, :notice => 'Datesprice was successfully created.') }
        format.xml  { render :xml => @datesprice, :status => :created, :location => @datesprice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datesprice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datesprices/1
  # PUT /datesprices/1.xml
  def update
    @datesprice = Datesprice.find(params[:id])

    respond_to do |format|
      if @datesprice.update_attributes(params[:datesprice])
        format.html { redirect_to(@datesprice, :notice => 'Datesprice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datesprice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datesprices/1
  # DELETE /datesprices/1.xml
  def destroy
    @datesprice = Datesprice.find(params[:id])
    @datesprice.destroy

    respond_to do |format|
      format.html { redirect_to(datesprices_url) }
      format.xml  { head :ok }
    end
  end
end

