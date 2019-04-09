require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :email,    String,     :required => true, :unique => true
  property :password, BCryptHash, :required => true

  def self.log_in(email, password)
    user = User.first(email: email)
    error_msg = 'Email or Password is incorrect'
    user.nil? || user.password != password ? raise(error_msg) : user
  end
end
