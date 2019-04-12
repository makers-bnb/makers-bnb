feature 'Notifications' do
  scenario 'User gets email notification on signup' do
    expect(MailHandlerDouble).to receive(:send).with('my_email', 'welcome')
    user_sign_up('my_email', 'password')
  end

  scenario 'Landlord receives email notification upon new request' do
    allow(MailHandlerDouble).to receive(:send)
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Bob's Bunker", 'My bunker is amazing', '50')
    user_sign_up('billyrenter@renters.com', 'love2rent')
    visit '/spaces'
    click_link 'Request to book'
    fill_in 'booking_date', with: "2020-07-22"
    expect(MailHandlerDouble).to receive(:send).with('johnnylandlord@landlords.com', 'new_request')
    click_button 'Request to book'
  end
end
