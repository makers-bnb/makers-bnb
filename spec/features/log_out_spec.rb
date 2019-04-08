feature 'Logging out' do
  scenario 'A logged in user can log out' do
    visit '/'
    fill_in 'email', :with => 'johnnylandlord@landlords.com'
    fill_in 'password', :with => 'moneymoneymoney'
    click_button 'Sign up!'
    click_link 'Log out'
    expect(page).to have_content "Goodbye"
  end
end