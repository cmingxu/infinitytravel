# -*- encoding : utf-8 -*-
class Admin::TravelPagesController < Admin::BaseController
  before_filter :load_travel

  def index
    @travel_pages = @travel.travel_pages
  end

  def create
    @travel_page = @travel.travel_pages.new(params[:travel_page])
    if @travel_page.save
      redirect_to admin_travel_travel_pages_path(@travel)
    else
      redirect_to admin_travel_travel_pages_path(@travel), :notice => @travel_page.errors.full_messages
    end
  end

  def destroy
    @travel_page = @travel.travel_pages.find params[:id]
    @travel_page.destroy
    redirect_to admin_travel_travel_pages_path(@travel)
  end

  def load_travel
    @travel = Travel.find(params[:travel_id])  
  end
end
