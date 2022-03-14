class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
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
