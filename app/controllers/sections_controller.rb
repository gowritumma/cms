class SectionsController < ApplicationController
  before_action :get_section, only: [:show, :edit, :update, :delete, :destroy]
  before_action :confirm_logged_in
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show

  end

  def new
    @section = Section.new(:name => 'Section', :visible => true)
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    if(@section.save)
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(:page_id => @page.id))
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('new')
    end
        
  end

  def edit
    @section_count = Section.count
  end

  def update
    if(@section.update_attributes(section_params))
      flash[:notice] = "Section updated successfully."
      puts "section updated."
      puts "page id  " + params[:page_id]  + " = " + @section.id.to_s
      redirect_to(section_path(:page_id => @page.id))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @section.destroy
    flash[:notice] = "Section #{@section.name} deleted successfully."
     redirect_to(sections_path(:page_id => @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:name, :visible, :position, :content, :content_type, :page_id)
  end

  def get_section
    @section = Section.find(params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
