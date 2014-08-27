class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "site"
  #force_ssl
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_username
    @current_username ||= User.find(session[:user_id]).forename if session[:user_id]
  end

  helper_method :current_user
  helper_method :current_username

  def authorize
    redirect_to root_url, alert: "Not authorized" if current_user.nil?
  end
end
