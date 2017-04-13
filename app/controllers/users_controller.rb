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

  def edit_password

  end

  def update_password
    @user = current_user
    puts @user.password
    if !@user.authenticate(params[:current_password])
      flash[:alert] = "Current password is wrong!"
      render :edit_password
    elsif @user.authenticate(params[:new_password])
      flash[:alert] = "New Password can not be same with current password!"
      render :edit_password
    elsif params[:new_password] != params[:new_password_confirmation]
      flash[:alert] = "New Password and confirmation are not the same!"
      render :edit_password
    else
      @user.update_attributes({password: params[:new_password], password_confirmation: params[:new_password_confirmation]})
      # @user.password = params[:new_password]
      # @user.password_confirmation = params[:new_password_confirmation]
      # @user.save
      flash[:notice] = "Password Changed successfully!"
      redirect_to root_path
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
