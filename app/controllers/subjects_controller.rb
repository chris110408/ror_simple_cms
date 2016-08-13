class SubjectsController < ApplicationController
  
  layout "admin"
  
  before_action :confirm_logged_in
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count
  end
  
  def create
    # instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # save the object
    if @subject.save
    # if save succeeds, redirect to the index action
      flash[:notice] = "subject created successfully"
      redirect_to(:action => 'index')
    else
    # if save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count
      render('new')
    end
  end 
  
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
      # find an exist object using form parameters
      @subject = Subject.find(params[:id])
      # save the object
      if  @subject.update_attributes(subject_params)
      # if save succeeds, redirect to the index action
        flash[:notice] = "subject created updated"
        redirect_to(:action => 'show',:id => @subject.id)
      else
      # if save fails, redisplay the form so user can fix problems
        @subject_count = Subject.count
        render('edit')
      end
  end 
  


  def delete
     @subject = Subject.find(params[:id])
  end
  
  def destroy
    @subject = Subject.find(params[:id]).destroy
    flash[:notice] = "subject destroyed successfully"
    redirect_to(:action =>'index')
  end 
  
  private
    def subject_params
      params.require(:subject).permit(:name,:position,:visible)
    end
end
