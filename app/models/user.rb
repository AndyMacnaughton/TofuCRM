class User < ActiveRecord::Base
  include Authentication

  EMAIL_REGEX = /.+@.+\..+/i

  validates :email,
    :presence => true,
    :uniqueness => true,
    :format => EMAIL_REGEX

  before_create { generate_token(:auth_token) }

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end
end
