class UserMailer < ActionMailer::Base
  default from: "andy.macnaughton@gmail.com"

  DELIVERY_OPTIONS = { user_name: 'andy.macnaughton@gmail.com',
                     password: 'macnaua1',
                     address: 'smtp.gmail.com' }

  def password_reset(user)
    @user = user
    @url  = root_url
    puts @user

    mail(
      to: @user.email,
      subject: 'Tofu Password Reset',
      delivery_options: DELIVERY_OPTIONS
    )
  end

  def welcome(user)
    @user = user
    @url  = root_url

    mail(
      to: @user.email,
      subject: 'Welcome to Tofu Bitch',
      delivery_options: DELIVERY_OPTIONS
    )

  end

end
