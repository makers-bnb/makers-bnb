feature 'Confirm booking' do
  scenario 'I can go to /requests and see requests against my spaces' do
    user_sign_up('firstUser@gmail.com', '123')
    add_space('My Place','Amazing flat', '50')
    click_link('Log out')
    user_sign_up('secondUser@gmail.com', '123')
    make_request('2019-04-09')
    click_link('Log out')
    user_log_in('firstUser@gmail.com', '123')
    visit '/requests'
    expect(page).to have_content('Pending')
    expect(page).to have_content('My Place')
    expect(page).to have_content('2019-04-09')
    expect(page).to have_content('secondUser@gmail.com')
  end
  scenario 'I click accept next to a request and see status changed to confirmed' do
    user_sign_up('firstUser@gmail.com', '123')
    add_space('My Place', 'Amazing flat', '50')
    click_link('Log out')
    user_sign_up('secondUser@gmail.com', '123')
    make_request('2019-04-09')
    click_link('Log out')
    user_log_in('firstUser@gmail.com', '123')
    visit '/requests'
    click_button 'Accept booking'
    expect(page).to have_content('Confirmed')
    expect(page).to have_content('My Place')
    expect(page).to have_content('2019-04-09')
    expect(page).to have_content('secondUser@gmail.com')
  end
  scenario 'I click reject next to a request and see status changed to rejected' do
    user_sign_up('firstUser@gmail.com', '123')
    add_space('My Place', 'Amazing flat', '50')
    click_link('Log out')
    user_sign_up('secondUser@gmail.com', '123')
    make_request('2019-04-09')
    click_link('Log out')
    user_log_in('firstUser@gmail.com', '123')
    visit '/requests'
    click_button 'Reject booking'
    expect(page).to have_content('Rejected')
    expect(page).to have_content('My Place')
    expect(page).to have_content('2019-04-09')
    expect(page).to have_content('secondUser@gmail.com')
  end
end
