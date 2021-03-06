class PagesController < ApplicationController
  layout "admin"
  before_action :confirm_logged_in
  before_action :find_subject
  
  def index
    
    @pages = Page.sorted
  end

  def show
     @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @subjects = Subject.order('position ASC')
    @page_count = Page.count + 1
  end
  def create
    @page = Page.new(page_params)
    
    if @page.save
      flash[:notice] = "page save successfully"
      redirect_to(:action => 'index')
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render('new')
    end
  end 

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = Page.count
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "page update successfully"
      redirect_to(:action => 'show',:id => @page.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
      render('new')
    end
  end
  
  def delete
     @page = Page.find(params[:id])
  end
  
  def destroy
     @page = Page.find(params[:id]).destroy
     flash[:notice] = "page destoryed successfully"
     redirect_to(:action => 'index')
     
  end 
  private 
    def page_params
      params.require(:page).permit(:subject_id,:permalink,:name,:position,:visible)
    end
    
    def find_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end
end
class PagesController < ApplicationController
  layout "admin"
  
  def index
    @pages = Page.sorted
  end

  def show
     @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @subjects = Subject.order('position ASC')
    @page_count = Page.count + 1
  end
  def create
    @page = Page.new(page_params)
    
    if @page.save
      flash[:notice] = "page save successfully"
      redirect_to(:action => 'index')
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render('new')
    end
  end 

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = Page.count
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "page update successfully"
      redirect_to(:action => 'show',:id => @page.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
      render('new')
    end
  end
  
  def delete
     @page = Page.find(params[:id])
  end
  
  def destroy
     @page = Page.find(params[:id]).destroy
     flash[:notice] = "page destoryed successfully"
     redirect_to(:action => 'index')
     
  end 
  private 
    def page_params
      params.require(:page).permit(:subject_id,:permalink,:name,:position,:visible)
    end
end
