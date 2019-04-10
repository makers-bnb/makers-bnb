feature 'User can log in' do
  scenario 'User enters pre-registered email and correct password and is logged in' do
    user_sign_up('test@gmail.com', 'password')
    visit '/logout'
    user_log_in('test@gmail.com', 'password')
    expect(page).to have_content('Hello test@gmail.com')
  end
  scenario 'User enters a non pre-registered email with password and is not logged in' do
    user_log_in('test@gmail.com', 'password')
    expect(page).to_not have_content('Hello test@gmail.com')
  end
  scenario 'User enters a pre-registered email with wrong password and is not logged in' do
    user_sign_up('test@gmail.com', 'password')
    visit '/logout'
    user_log_in('test@gmail.com', 'wrong_password')
    expect(page).to_not have_content('Hello test@gmail.com')
  end
end
