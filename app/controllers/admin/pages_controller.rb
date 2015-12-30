# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin pages name:string title:string cont:text 

class Admin::PagesController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /pages
  # GET /pages.xml
  def index
    @pages = scope.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html do
        ap @travel
        if @travel
          render "travel_pages"
        else
          render
        end
      end
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = scope.find_by_name(params[:id]) || scope.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = scope.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = scope.find_by_name(params[:id]) || scope.find_by_id(params[:id])
    ap  @page
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = scope.new(page_param)

    respond_to do |format|
      if @page.save
        format.html { redirect_to(admin_pages_url, :notice => 'scope was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = scope.find_by_name(params[:id])|| scope.find_by_id(params[:id])

    respond_to do |format|
      if @page.update_attributes(page_param)
        format.html { redirect_to([:admin, @page], :notice => 'scope was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = scope.find_by_name(params[:id]) || scope.find_by_id(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(admin_pages_url) }
      format.xml  { head :ok }
    end
  end

  def assign
    @travel = Travel.find(params[:travel_id])
    @page = Page.find(params[:id])
    if params[:category].blank?
      redirect_to admin_travel_pages_path(@travel), :notice => "分类不得为空！"
      return
    end
    @page.category = params[:category]
    @page.attachable_id = @travel.id
    @page.attachable_type = "Travel"
    @page.save
    redirect_to  admin_travel_pages_path(@travel)
  end

  def detach
    @travel = Travel.find(params[:travel_id])
    @page = Page.find(params[:id])
    @page.category = ""
    @page.attachable_id = nil
    @page.attachable_type = nil
    @page.save
    redirect_to  admin_travel_pages_path(@travel)
  end

  def scope
    if params[:travel_id] and (@travel = Travel.find(params[:travel_id]))
      @travel.pages
    else
      Page
    end
  end

  def page_param
    params.require(:page).permit!
  end
end
