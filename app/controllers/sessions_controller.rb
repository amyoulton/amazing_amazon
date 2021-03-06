class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    
    if user&.authenticate params[:password]
      session[:user_id] = user.id
      session[:color] = 'green'
      flash[:success] = "User Logged In"
      redirect_to products_path
    else
      flash[:warning] = "Couldn't log In"
      render :new
    end
end

  def destroy
  session[:user_id] = nil
  redirect_to products_path
  end

 
end