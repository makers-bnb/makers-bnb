feature 'Request a booking' do
  scenario "a user can not request a booking outside the space's available range" do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Bob's Bunker", 'My bunker is amazing', '50', '2019-04-20', '2019-04-29')
    user_sign_up('billyrenter@renters.com', 'love2rent')
    click_link 'Log out'
    user_sign_up('renter@renter', 'password')
    click_link 'Request to book'
    page.should have_selector('#request_date_picker[data-availability-start="2019-04-20"]')
    page.should have_selector('#request_date_picker[data-availability-end="2019-04-29"]')
  end
end
