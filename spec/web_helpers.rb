def user_sign_up(email, password)
  visit '/'
  fill_in 'email', :with => email
  fill_in 'password', :with => password
  click_button 'Sign up!'
end
