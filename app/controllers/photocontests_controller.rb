# -*- encoding : utf-8 -*-
class PhotocontestsController < ApplicationController
  # GET /photocontests
  # GET /photocontests.xml
  def index
    @photocontests = Photocontest.all
    @sbanner = Banner.find_by_imgname("users")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photocontests }
    end
  end

end
