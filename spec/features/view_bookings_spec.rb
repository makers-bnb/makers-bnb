feature "Requests page" do
  scenario "'Your requests' does not display if user has not made any" do
    user_sign_up('landlord@landlord.com', 'password')
    add_space("Bob's Bunker", 'My bunker is amazing', '50')
    user_sign_up('renter@renter.com', 'password')
    visit '/spaces'
    click_link 'Request to book'
    fill_in 'booking_date', with: "2020-07-22"
    click_button 'Request to book'
    click_link 'Log out'
    user_log_in('landlord@landlord.com', 'password')
    click_link 'Requests'
    expect(page).not_to have_content "Your requests"
    expect(page).to have_content "Requests for your spaces"
  end

  scenario "'Requests for your spaces' does not display if there aren't any" do
    user_sign_up('landlord@landlord.com', 'password')
    add_space("Bob's Bunker", 'My bunker is amazing', '50')
    user_sign_up('renter@renter.com', 'password')
    visit '/spaces'
    click_link 'Request to book'
    fill_in 'booking_date', with: "2020-07-22"
    click_button 'Request to book'
    add_space("Renter has a property too", "It's a nice one", '100')
    click_link('Requests')
    expect(page).to have_content "Your requests"
    expect(page).not_to have_content "Requests for your spaces"
  end
end
