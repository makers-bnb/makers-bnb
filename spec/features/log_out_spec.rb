feature 'Logging out' do
  scenario 'A signed up user can log out' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    click_link 'Log out'
    expect(page).to have_button "Log in"
  end
  scenario 'A logged in user can log out' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    click_link 'Log out'
    user_log_in('johnnylandlord@landlords.com', 'moneymoneymoney')
    click_link 'Log out'
    expect(page).to have_button "Log in"
  end
end
