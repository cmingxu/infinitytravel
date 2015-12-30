# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin shouyes logo:string title:string lianxi:text block_1_tit:string block_1_cont:text block_2_pic_1:string block_2_pic_2:string block_2_tit:string block_2_cont:text block_2_link:string block_3_tit:string block_3_cont:string block_3_pic:string block_3_link:string block_4_tit:string block_4_1_pic:string block_4_1_tit:string block_4_1_cont:text block_4_1_link:string block_4_2_pic:string block_4_2_tit:string block_4_2_cont:text block_4_2_link:string block_4_3_pic:string block_4_3_tit:string block_4_3_cont:text block_4_3_link:string phone:string 

class Admin::ShouyesController < ApplicationController
  layout "admin"
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /shouyes
  # GET /shouyes.xml
  def index
    @shouyes = Shouye.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shouyes }
    end
  end

  # GET /shouyes/1
  # GET /shouyes/1.xml
  def show
    @shouye = Shouye.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shouye }
    end
  end

  # GET /shouyes/new
  # GET /shouyes/new.xml
  def new
    @shouye = Shouye.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shouye }
    end
  end

  # GET /shouyes/1/edit
  def edit
    @shouye = Shouye.find(params[:id])
  end

  # POST /shouyes
  # POST /shouyes.xml
  def create
    @shouye = Shouye.new(showye_param)

    respond_to do |format|
      if @shouye.save
        format.html { redirect_to(admin_shouyes_url, :notice => 'Shouye was successfully created.') }
        format.xml  { render :xml => @shouye, :status => :created, :location => @shouye }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shouye.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shouyes/1
  # PUT /shouyes/1.xml
  def update
    @shouye = Shouye.find(params[:id])

    respond_to do |format|
      if @shouye.update_attributes(shouye_param)
        format.html { redirect_to([:admin, @shouye], :notice => 'Shouye was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shouye.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shouyes/1
  # DELETE /shouyes/1.xml
  def destroy
    @shouye = Shouye.find(params[:id])
    @shouye.destroy

    respond_to do |format|
      format.html { redirect_to(admin_shouyes_url) }
      format.xml  { head :ok }
    end
  end

  def shouye_param
    params.require(:shouye).permit!
  end
end
