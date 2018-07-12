class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/session/new'
    mail(to: user.username, subject: 'Welcome to our cat site!')
  end

end
