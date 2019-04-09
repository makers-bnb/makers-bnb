require 'user'
describe User do
  describe '.log_in' do
    it 'returns a user from the DB when email and password match an entry in user table' do
      new_user = User.create(email: 'test@gmail.com', password: 'password')
      logged_in_user = User.log_in('test@gmail.com', 'password')
      expect(new_user.email).to eq logged_in_user.email
      expect(new_user.id).to eq logged_in_user.id
    end
    it 'should raise an exception if password does not match email from entry in user table' do
      User.create(email: 'test1@gmail.com', password: 'password1')
      expect { User.log_in('test1@gmail.com', 'wrong_password1') }.to raise_error('Email or Password is incorrect')
    end
    it 'should raise an exception if email does not match an entry in user table' do
      expect { User.log_in('test2@gmail.com', 'irrelevant_password2') }.to raise_error('Email or Password is incorrect')
    end
  end
end
