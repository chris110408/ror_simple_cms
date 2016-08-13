class AccessController < ApplicationController
  
  layout 'admin'
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login,:logout]
  
  def index
  end

  def login
  end
  
  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authrized_user = found_user.authenticate(params[:password])
      end
    end 
    if authrized_user
      session[:user_id] = authrized_user.id
      session[:username] = authrized_user.username
      flash[:notice] = "you are logged in"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password"
      redirect_to(:action => 'login')
    end
  end 
  
  def logout
      session[:user_id] = nil
      session[:username] = nil
      flash[:notice] = "Logged out"
      redirect_to(:action => 'login')
  end
  
 

end
