describe Notify do
  let(:subject) { described_class.new(mail_handler) }
  let(:mail_handler) { double :mail_handler }
  let(:user) { double :user, email: 'my_email' }

  describe '#send_welcome_email' do
    it 'sends an email to the user' do
      expect(mail_handler).to receive(:send).with('my_email', 'welcome')
      subject.send_welcome_email(user)
    end
  end
end
