# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin photocontests username:string name:string desc:string photo:string 

class Admin::PhotocontestsController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /photocontests
  # GET /photocontests.xml
  def index
    @photocontests = Photocontest.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photocontests }
    end
  end

  # GET /photocontests/1
  # GET /photocontests/1.xml
  def show
    @photocontest = Photocontest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photocontest }
    end
  end

  # GET /photocontests/new
  # GET /photocontests/new.xml
  def new
    @photocontest = Photocontest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photocontest }
    end
  end

  # GET /photocontests/1/edit
  def edit
    @photocontest = Photocontest.find(params[:id])
  end

  # POST /photocontests
  # POST /photocontests.xml
  def create
    @photocontest = Photocontest.new(photocontest_param)

    respond_to do |format|
      if @photocontest.save
        format.html { redirect_to(admin_photocontests_url, :notice => 'Photocontest was successfully created.') }
        format.xml  { render :xml => @photocontest, :status => :created, :location => @photocontest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photocontest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photocontests/1
  # PUT /photocontests/1.xml
  def update
    @photocontest = Photocontest.find(params[:id])

    respond_to do |format|
      if @photocontest.update_attributes(photocontest_param)
        format.html { redirect_to([:admin, @photocontest], :notice => 'Photocontest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photocontest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photocontests/1
  # DELETE /photocontests/1.xml
  def destroy
    @photocontest = Photocontest.find(params[:id])
    @photocontest.destroy

    respond_to do |format|
      format.html { redirect_to(admin_photocontests_url) }
      format.xml  { head :ok }
    end
  end


  def photocontest_param
    params.require(:photocontest).permit!
  end
end
