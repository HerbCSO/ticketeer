class UserMailer < ActionMailer::Base
  default from: 'notifications@ticketeer.herokuapp.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://ticketeer.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
