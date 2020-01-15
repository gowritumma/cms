class SubjectsController < ApplicationController
  before_action :confirm_logged_in
  before_action :get_subject, only: [:show, :edit, :update, :delete, :destroy]
  def index
    @subjects = Subject.sorted

  end

  def show
    
  end

  def new
    @subject = Subject.new({:name => 'Subject'})
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if(@subject.save)
      flash[:notice] = "Subject created Successfully."
      redirect_to(subjects_path)
    else
       @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
   @subject_count = Subject.count
  end

  def update
    
    if(@subject.update_attributes(subject_params))
      flash[:notice] = "Subject updated Successfully. "
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count
      render('edit')
    end
        
  end

  def delete
    
  end

  def destroy
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted Successfully "
    redirect_to(subjects_path)
  end

  private

  def get_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
