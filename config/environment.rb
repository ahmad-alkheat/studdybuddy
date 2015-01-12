# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.default_url_options = { :host => 'https://vast-badlands-7913.herokuapp.com/' }

ActionMailer::Base.smtp_settings = {
  :user_name => 'RailsOuter',
  :password => 'ahmad0000',
  :domain => 'example.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}