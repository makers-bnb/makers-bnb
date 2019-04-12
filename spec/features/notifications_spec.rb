feature 'Notifications' do
  scenario 'User gets email notification on signup' do
    expect(MailHandlerDouble).to receive(:send).with('my_email', 'welcome')
    user_sign_up('my_email', 'password')
  end
end
