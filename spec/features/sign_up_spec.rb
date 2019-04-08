feature 'Signing up' do
  scenario 'A new user can sign up' do
    visit '/'
    fill_in 'email', :with => 'johnnylandlord@landlords.com'
    fill_in 'password', :with => 'moneymoneymoney'
    click_button 'Sign up!'
    expect(page).to have_content 'New account created with email: johnnylandlord@landlords.com'
  end
end
