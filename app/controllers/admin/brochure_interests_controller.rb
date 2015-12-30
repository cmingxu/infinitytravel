# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin brochure_interests brochure_id:integer interest_id:integer 

class Admin::BrochureInterestsController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /brochure_interests
  # GET /brochure_interests.xml
  def index
    @brochure_interests = BrochureInterest.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brochure_interests }
    end
  end

  # GET /brochure_interests/1
  # GET /brochure_interests/1.xml
  def show
    @brochure_interest = BrochureInterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brochure_interest }
    end
  end

  # GET /brochure_interests/new
  # GET /brochure_interests/new.xml
  def new
    @brochure_interest = BrochureInterest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brochure_interest }
    end
  end

  # GET /brochure_interests/1/edit
  def edit
    @brochure_interest = BrochureInterest.find(params[:id])
  end

  # POST /brochure_interests
  # POST /brochure_interests.xml
  def create
    @brochure_interest = BrochureInterest.new(params[:brochure_interest])

    respond_to do |format|
      if @brochure_interest.save
        format.html { redirect_to(admin_brochure_interests_url, :notice => 'Brochure interest was successfully created.') }
        format.xml  { render :xml => @brochure_interest, :status => :created, :location => @brochure_interest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brochure_interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brochure_interests/1
  # PUT /brochure_interests/1.xml
  def update
    @brochure_interest = BrochureInterest.find(params[:id])

    respond_to do |format|
      if @brochure_interest.update_attributes(params[:brochure_interest])
        format.html { redirect_to([:admin, @brochure_interest], :notice => 'Brochure interest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brochure_interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brochure_interests/1
  # DELETE /brochure_interests/1.xml
  def destroy
    @brochure_interest = BrochureInterest.find(params[:id])
    @brochure_interest.destroy

    respond_to do |format|
      format.html { redirect_to(admin_brochure_interests_url) }
      format.xml  { head :ok }
    end
  end
end
