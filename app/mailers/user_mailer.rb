class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def email(from, to, content)
  	@sender = from
  	@recipient = to
  	@content = content
  	@url = 'http://www.google.com'
  	mail(from: @sender, to: @recipient, subject: 'Someone would like to study with you on StuddyBuddy')
  end
end
