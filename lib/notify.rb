require_relative './mail_handler'

class Notify
  def initialize(mail_handler = MailHandler)
    @mail_handler = mail_handler
  end

  def send_welcome_email(user)
    @mail_handler.send(user.email, 'welcome')
  end
end
