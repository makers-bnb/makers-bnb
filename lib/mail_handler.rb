require 'pony'
require 'dotenv/load'

class MailHandler
  @@user = ENV['EMAIL_USER']
  @@smtp_server = ENV['EMAIL_SMTP_SERVER']
  @@port = ENV['EMAIL_PORT']
  @@password = ENV['EMAIL_PASSWORD']
  @@suppress_emails = ENV['EMAIL_SUPPRESS'] == "true"
  @@email_path = File.join(File.dirname(__FILE__), '../emails')

  def self.send(email_address, message)
    email_template = "#{@@email_path}/#{message}.txt"
    if @@suppress_emails
      puts "#{message} template would have been sent to #{email_address}"
    else
      puts "Sending #{email_template} to #{email_address}"
      Pony.mail({
        :to => email_address,
        :from => 'makers@makersbnb.com',
        :subject => 'hi',
        :body => File.read(email_template),
        :via => :smtp,
        :via_options => {
          :address              => @@smtp_server,
          :port                 => @@port,
          :enable_starttls_auto => true,
          :user_name            => @@user,
          :password             => @@password,
          :authentication       => :plain,
          :domain               => "localhost.localdomain"
        }
      })
    end
  end
end
