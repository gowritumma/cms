class PagesController < ApplicationController
  before_action :get_page, only: [:show, :edit, :delete, :destroy, :update]
  before_action :confirm_logged_in
  before_action :find_subject
  def index
    @pages = @subject.pages.sorted
  end

  def show

  end

  def new
    @page = Page.new(:visible => true, :name => 'Page', :permalink => 'link', :subject_id => @subject.id)
    @page_count = Page.count + 1

  end

  def create
    @page = Page.new(page_params)
    if(@page.save)
      flash[:notice] = "Page created successfully."
      redirect_to(pages_path(:subject_id => @subject.id))
    else
       @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
     @page_count = Page.count 
  end

  def update
    if(@page.update_attributes(page_params))
      flash[:notice] = "Page updated successfully."
      redirect_to(page_path(:subject_id => @subject.id))
    else
       @page_count = Page.count 
      render('edit')
    end
  end

  def delete

  end

  def destroy
    @page.destroy
    flash[:notice] = "Page deleted #{@page.name} successfully."
    redirect_to(pages_path(:subject_id => @subject.id))
  end

  private
  
  def page_params
    params.require(:page).permit(:name, :visible, :permalink, :subject_id)
  end
  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def get_page
    @page = Page.find(params[:id])
  end
end
