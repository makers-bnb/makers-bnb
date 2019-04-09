feature 'Confirm booking' do
  scenario 'I can go to /requests and see requests against my spaces' do
    user_sign_up('firstUser@gmail.com', '123')
    add_space('My Place','Amazing flat', '50')
    user_sign_up('secondUser@gmail.com', '123')
    make_request('2019-04-09')
    user_log_in('firstUser@gmail.com', '123')
    visit '/requests'
    expect(page).to have_content('Pending')
    expect(page).to have_content('My Place')
    expect(page).to have_content('2019-04-09')
    expect(page).to have_content('secondUser@gmail.com')
  end
  # scenario 'I click confirm next to a request and see status changed to confirmed' do
  #
  # end
  # scenario 'I click reject next to a request and see status changed to rejected' do
  #
  # end
end
