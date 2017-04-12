class UsersController < ApplicationController
  before_action :get_user, only:[:update, :edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing in"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit([:first_name, :last_name, :email]))
      flash[:notice] = "User Infomation Updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit([:first_name, :last_name, :email, :description, :password, :password_confirmation])
  end
end
