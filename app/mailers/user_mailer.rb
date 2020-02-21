class UserMailer < ActionMailer::Base
  default from: 'lekha.kotamreddy@gmail.com'
 
  def welcome_email(userr)
    @u=userr
    
    # @url  = 'http://example.com/login'
    mail(to: userr.email, subject: 'Welcome to My Awesome Site')
  end
end
