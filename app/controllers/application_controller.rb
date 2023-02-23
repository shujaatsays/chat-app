class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id].present?
  end

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user

    redirect_to root_path
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
