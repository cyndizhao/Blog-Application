# require 'date'
class ApplicationController < ActionController::Base
  # before_action :update_time_stamp
  protect_from_forgery with: :exception
  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find_by_id session[:user_id] if user_signed_in?
  end
  helper_method :current_user

  def authenticate_user!
    if !user_signed_in?
      redirect_to new_session_path, notice: 'You must be signed in!'
    end
  end
  # def last_time_stamp
  #   session[:last_time_stamp]
  # end
  # helper_method :last_time_stamp
  #
  # def update_time_stamp
  #   p session
  #   # session[:last_time_stamp] = DateTime.now
  # end
end
