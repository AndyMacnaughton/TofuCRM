class UserMailer < ActionMailer::Base
  default from: "andy.macnaughton@gmail.com"

    def password_reset(user)
      @user = user
      mail :to => user.email, :subject => "Password Reset"
    end
end
