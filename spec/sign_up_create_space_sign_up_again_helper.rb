def sign_up_create_space_sign_up_again
  visit '/'
  fill_in 'email', with: 'johnnylandlord@landlords.com'
  fill_in 'password', with: 'moneymoneymoney'
  click_button 'Sign up!'
  visit '/spaces/new'
  fill_in 'name', with: "Bob's Bunker"
  fill_in 'description', with: 'My bunker is amazing'
  fill_in 'price', with: '50'
  click_button 'Submit'
  # seperate log in.... 
  visit '/'
  fill_in 'email', with: 'billyrenter@renters.com'
  fill_in 'password', with: 'love2rent'
  click_button 'Sign up!'
end