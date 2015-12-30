# -*- encoding : utf-8 -*-
class GbookingdaysController < ApplicationController
  # GET /gbookingdays
  # GET /gbookingdays.xml
  def index
    @gbookingdays = Gbookingday.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gbookingdays }
    end
  end

  # GET /gbookingdays/1
  # GET /gbookingdays/1.xml
  def show
    @gbookingday = Gbookingday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gbookingday }
    end
  end

  # GET /gbookingdays/new
  # GET /gbookingdays/new.xml
  def new
    @gbookingday = Gbookingday.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gbookingday }
    end
  end

  # GET /gbookingdays/1/edit
  def edit
    @gbookingday = Gbookingday.find(params[:id])
  end

  # POST /gbookingdays
  # POST /gbookingdays.xml
  def create
    @gbookingday = Gbookingday.new(params[:gbookingday])

    respond_to do |format|
      if @gbookingday.save
        format.html { redirect_to(@gbookingday, :notice => 'Gbookingday was successfully created.') }
        format.xml  { render :xml => @gbookingday, :status => :created, :location => @gbookingday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gbookingday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gbookingdays/1
  # PUT /gbookingdays/1.xml
  def update
    @gbookingday = Gbookingday.find(params[:id])

    respond_to do |format|
      if @gbookingday.update_attributes(params[:gbookingday])
        format.html { redirect_to(@gbookingday, :notice => 'Gbookingday was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gbookingday.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gbookingdays/1
  # DELETE /gbookingdays/1.xml
  def destroy
    @gbookingday = Gbookingday.find(params[:id])
    @gbookingday.destroy

    respond_to do |format|
      format.html { redirect_to(gbookingdays_url) }
      format.xml  { head :ok }
    end
  end
end
