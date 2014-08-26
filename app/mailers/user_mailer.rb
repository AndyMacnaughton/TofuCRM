class UserMailer < ActionMailer::Base
  default from: 'tofu.com'

  def password_reset(user)
    @user = user

    mail(
      to: @user.email,
      subject: 'Tofu Password Reset'
    )
  end

  def welcome(user)
    @user = user
    @url  = login_url

    mail(
      to: @user.email,
      subject: 'Welcome to Tofu Bitch'
    )

  end

end
