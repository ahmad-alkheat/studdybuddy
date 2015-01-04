class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(sender,receiver)
  	@user = sender
  	@url = 'http://www.google.com'
  	mail(to: @user.email, from: receiver.email,  subject: 'Welcome')
  end
end
