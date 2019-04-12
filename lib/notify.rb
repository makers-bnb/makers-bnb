require_relative './mail_handler'

class Notify
  def initialize(mail_handler = MailHandler)
    @mail_handler = mail_handler
  end

  def welcome_new_user(user)
    @mail_handler.send(user.email, 'welcome')
  end

  def notify_landlord_of_new_request(user)
    @mail_handler.send(user.email, 'new_request')
  end
end
