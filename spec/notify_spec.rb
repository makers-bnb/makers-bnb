describe Notify do
  let(:subject) { described_class.new(mail_handler) }
  let(:mail_handler) { double :mail_handler }
  let(:user) { double :user, email: 'my_email' }

  describe '#welcome_new_user' do
    it 'sends an email to the user' do
      expect(mail_handler).to receive(:send).with('my_email', 'welcome')
      subject.welcome_new_user(user)
    end
  end

  describe '#notify_landlord_of_new_request' do
    it 'sends an email to the user' do
      expect(mail_handler).to receive(:send).with('my_email', 'new_request')
      subject.notify_landlord_of_new_request(user)
    end
  end
end
