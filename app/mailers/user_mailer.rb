class UserMailer < ActionMailer::Base

  def password_reset(user)
    @user = user
    @url  = root_url

    mail(
      to: @user.email,
      subject: 'Tofu Password Reset'
    )
  end

  def welcome(user)
    @user = user
    @url  = root_url

    mail(
      to: @user.email,
      subject: 'Welcome to Tofu Bitch'
    )

  end

end
