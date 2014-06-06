class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
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
