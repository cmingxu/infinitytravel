# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin brochures name:string desc:text cover:string doc:string comment:text 

class Admin::BrochuresController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /brochures
  # GET /brochures.xml
  def index
    @brochures = Brochure.order("updated_at DESC").page(params[:page])

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

  # GET /brochures/new
  # GET /brochures/new.xml
  def new
    @brochure = Brochure.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brochure }
    end
  end

  # GET /brochures/1/edit
  def edit
    @brochure = Brochure.find(params[:id])
  end

  # POST /brochures
  # POST /brochures.xml
  def create
    @brochure = Brochure.new(brochure_param)

    respond_to do |format|
      if @brochure.save
        format.html { redirect_to(admin_brochures_url, :notice => 'Brochure was successfully created.') }
        format.xml  { render :xml => @brochure, :status => :created, :location => @brochure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brochure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brochures/1
  # PUT /brochures/1.xml
  def update
    @brochure = Brochure.find(params[:id])

    respond_to do |format|
      if @brochure.update_attributes(brochure_param)
        format.html { redirect_to([:admin, @brochure], :notice => 'Brochure was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brochure.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brochures/1
  # DELETE /brochures/1.xml
  def destroy
    @brochure = Brochure.find(params[:id])
    @brochure.destroy

    respond_to do |format|
      format.html { redirect_to(admin_brochures_url) }
      format.xml  { head :ok }
    end
  end

  def brochure_param
    params.require(:brochure).permit!
  end
end
