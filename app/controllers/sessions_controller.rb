class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]='You are logged in!'
      redirect_to user
      #log the user in and redirect to the user's show page
    else
      #create an error message
      flash[:danger]='invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    flash[:warning] = 'You have not been logged out'
    redirect_to root_path

  end

  private


end
