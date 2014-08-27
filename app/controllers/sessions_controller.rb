class SessionsController < ApplicationController
  def new
    if !current_user.nil?
      redirect_to dashboard_path
    end
  end

  def create
    user = User.authenticate(params[:email],params[:password])
    if user
      cookies[:auth_token] = user.auth_token
      session[:user_name] = user.forename
      session[:user_id] = user.id
      redirect_to "/dashboard", :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
