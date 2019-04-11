feature 'User can log in' do
  scenario 'User is logged in if they present valid credentials' do
    user_sign_up('test@gmail.com', 'password')
    click_button 'Log out'
    user_log_in('test@gmail.com', 'password')
    expect(page).to have_content('Hello test@gmail.com')
  end
  scenario 'System shows an error if account does not exist' do
    user_log_in('test@gmail.com', 'password')
    expect(page).to_not have_content('Hello test@gmail.com')
    expect(page).to have_content('Invalid login details.')
  end
  scenario 'System shows an error if incorrect password given' do
    user_sign_up('test@gmail.com', 'password')
    click_button 'Log out'
    user_log_in('test@gmail.com', 'wrong_password')
    expect(page).to_not have_content('Hello test@gmail.com')
    expect(page).to have_content('Invalid login details.')
  end
end
