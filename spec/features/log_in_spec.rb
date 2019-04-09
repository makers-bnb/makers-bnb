feature 'User can log in' do
  scenario 'User enters pre-registered email and correct password and is logged in' do
    user_sign_up('test@gmail.com', 'password')
    visit '/logout'
    visit '/'
    click_link 'Log in'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('User: test@gmail.com')
  end
end
