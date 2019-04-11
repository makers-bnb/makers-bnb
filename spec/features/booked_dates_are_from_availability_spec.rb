feature 'Booked dates are unavailable' do
  scenario "Dates which are already booked should appear in a data attribute on the date picker" do
    user_sign_up('landlord@landlord', 'password')
    add_space('My flat', 'Is a very nice flat', '99', '2020-05-01', '2020-05-20')
    click_button('Log out')
    user_sign_up('renter@renter', 'password')
    make_request('2020-05-03')
    click_button('Log out')
    user_log_in('landlord@landlord', 'password')
    approve_request
    click_button('Log out')
    user_sign_up('renter2@renter', 'password')
    click_link('Request to book')
    expect(page).to have_selector('#request_date_picker[data-booked-dates="2020-05-03"]')
  end
end
