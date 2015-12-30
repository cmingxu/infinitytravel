# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin interests title:string cont:text ancestry:string 

class Admin::InterestsController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /interests
  # GET /interests.xml
  def index
    @interests = Interest.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interests }
    end
  end

  # GET /interests/1
  # GET /interests/1.xml
  def show
    @interest = Interest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interest }
    end
  end

  # GET /interests/new
  # GET /interests/new.xml
  def new
    @interest = Interest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interest }
    end
  end

  # GET /interests/1/edit
  def edit
    @interest = Interest.find(params[:id])
  end

  # POST /interests
  # POST /interests.xml
  def create
    @interest = Interest.new(interest_param)

    respond_to do |format|
      if @interest.save
        format.html { redirect_to(admin_interests_url, :notice => 'Interest was successfully created.') }
        format.xml  { render :xml => @interest, :status => :created, :location => @interest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interests/1
  # PUT /interests/1.xml
  def update
    @interest = Interest.find(params[:id])

    respond_to do |format|
      if @interest.update_attributes(interest_param)
        format.html { redirect_to([:admin, @interest], :notice => 'Interest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interests/1
  # DELETE /interests/1.xml
  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy

    respond_to do |format|
      format.html { redirect_to(admin_interests_url) }
      format.xml  { head :ok }
    end
  end

  #绑定相关PDF
  def new_brochure_interest
    @interest = Interest.find(params[:id])
  end

  def create_brochure_interest
    @interest = Interest.find(params[:id])
    @brochure = Brochure.find(params[:brochure_id])
    @interest.brochures << @brochure

    respond_to do |format|
      if @interest.save
        format.html { redirect_to([:admin, @interest], :notice => 'Interest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "new_brochure_interest" }
        format.xml  { render :xml => @interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy_brochure_interest
    @interest = Interest.find(params[:id])
    @brochure = Brochure.find(params[:brochure_id])
    

    respond_to do |format|
      if BrochureInterest.where("interest_id = ? AND brochure_id = ?", @interest.id , @brochure.id ).destroy_all
        format.html { redirect_to([:admin, @interest], :notice => 'Interest was successfully updated.') }
        format.xml  { head :ok }
      end
    end
  end

  def interest_param
    params.require(:interest).permit!
  end
end

