class UserMailer < ApplicationMailer
  def account_setup(new_user)
    @greeting = "Hello #{new_user.username}, welcome to Virtual Watch Party. Feel free to create viewing events and invite your friends!"
    @user = new_user

    mail(to: new_user.email, subject: 'Welcome to Virtual Watch Party')
  end
end
