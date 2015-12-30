# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin specialoffers cover:string title:string desc:text cont:text 

class Admin::SpecialoffersController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /specialoffers
  # GET /specialoffers.xml
  def index
    @specialoffers = Specialoffer.order("updated_at DESC").page(params[:page])

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
    @specialoffer = Specialoffer.new(specialoffer_param)

    respond_to do |format|
      if @specialoffer.save
        format.html { redirect_to(admin_specialoffers_url, :notice => 'Specialoffer was successfully created.') }
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
      if @specialoffer.update_attributes(specialoffer_param)
        format.html { redirect_to([:admin, @specialoffer], :notice => 'Specialoffer was successfully updated.') }
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
      format.html { redirect_to(admin_specialoffers_url) }
      format.xml  { head :ok }
    end
  end

  def specialoffer_param
    params.require(:specialoffer).permit!
  end
end

