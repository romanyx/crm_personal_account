# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CrmPersonalAccount::Application.initialize!

ActionMailer::Base.smtp_settings = {
   :address => 'mail.crimeainfo.com',
   :port => 25,
   :domain => 'ruby.ci.ukrpack.net'
} 
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true