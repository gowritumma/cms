class PublicController < ApplicationController
  
  def index
  end

  def show
  	@page = Page.where(:permalink => params[:permalink]).first
  	if @page.nil
  		redirect_to(root_path)
  	end
  end
end
