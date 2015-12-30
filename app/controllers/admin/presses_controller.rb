# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin presses title:string cont:text 

class Admin::PressesController < Admin::BaseController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /presses
  # GET /presses.xml
  def index
    @presses = Press.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @presses }
    end
  end

  # GET /presses/1
  # GET /presses/1.xml
  def show
    @press = Press.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @press }
    end
  end

  # GET /presses/new
  # GET /presses/new.xml
  def new
    @press = Press.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @press }
    end
  end

  # GET /presses/1/edit
  def edit
    @press = Press.find(params[:id])
  end

  # POST /presses
  # POST /presses.xml
  def create
    @press = Press.new(press_param)

    respond_to do |format|
      if @press.save
        format.html { redirect_to(admin_presses_url, :notice => 'Press was successfully created.') }
        format.xml  { render :xml => @press, :status => :created, :location => @press }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @press.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /presses/1
  # PUT /presses/1.xml
  def update
    @press = Press.find(params[:id])

    respond_to do |format|
      if @press.update_attributes(press_param)
        format.html { redirect_to([:admin, @press], :notice => 'Press was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @press.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /presses/1
  # DELETE /presses/1.xml
  def destroy
    @press = Press.find(params[:id])
    @press.destroy

    respond_to do |format|
      format.html { redirect_to(admin_presses_url) }
      format.xml  { head :ok }
    end
  end

  def press_param
    params.require(:press).permit!
  end
end
