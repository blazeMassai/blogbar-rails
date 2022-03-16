class UsersController < ApplicationController

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def new
    @user = User.new
  end

  def show
    if current_user.nil?
      redirect_to '/login'
    else
      @user = User.find(params[:id])
    end

  end

  def index
    if current_user.nil?
      redirect_to '/login'
    else
      @users = User.all
    end

  end

  def create
    @user = User.new(user_params)
    # render plain: @user.inspect
    if @user.save
      flash[:success] = "User was created successfully!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    @users.destroy
    redirect_to index
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
