feature 'Signing up' do
  scenario 'A new user can sign up' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    expect(page).to have_content 'Hello johnnylandlord@landlords.com'
  end

  scenario 'An error is shown if no username is provided' do
    user_sign_up('', 'moneymoneymoney')
    expect(page).to have_content 'Could not create user. All fields are required.'
  end

  scenario 'An error is shown if no password is provided' do
    user_sign_up('johnnylandlord@landlords.com', '')
    expect(page).to have_content 'Could not create user. All fields are required.'
  end

  scenario 'An error is shown if the account already exists' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    expect(page).to have_content 'Could not create user. User already exists.'
  end
end
