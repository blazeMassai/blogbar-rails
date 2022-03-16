module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    !current_user.nil?
  end

  def require_user
    if !logged_in?
      flash[:warning] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

end
