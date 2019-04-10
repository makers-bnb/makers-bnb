feature 'Request a booking' do
  scenario 'a user can visit the booking page for a space' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Bob's Bunker", 'My bunker is amazing', '50')
    user_sign_up('billyrenter@renters.com', 'love2rent')
    visit '/spaces'
    click_link 'Request to book'
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_button "Request to book"
  end

  scenario "a user can request a booking for one night" do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Bob's Bunker", 'My bunker is amazing', '50')
    user_sign_up('billyrenter@renters.com', 'love2rent')
    visit '/spaces'
    click_link 'Request to book'
    fill_in 'booking_date', with: "2020-07-22"
    click_button 'Request to book'
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_content "2020-07-22"
    expect(page).to have_content "Pending"
  end
  scenario "a user can not request a booking not in space's available range" do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Bob's Bunker", 'My bunker is amazing', '50', '2019-04-20', '2019-04-29')
    user_sign_up('billyrenter@renters.com', 'love2rent')
    visit '/spaces'
    click_link 'Request to book'
    expect(find('#request_date_picker')['min']).to eq('2019-04-20')
    expect(find('#request_date_picker')['max']).to eq('2019-04-29')
  end
end
