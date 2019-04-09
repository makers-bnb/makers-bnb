def user_sign_up(email, password)
  visit '/'
  fill_in 'email', :with => email
  fill_in 'password', :with => password
  click_button 'Sign up!'
end

def user_log_in(email, password)
  visit '/'
  click_link 'Log in'
  fill_in 'email', :with => email
  fill_in 'password', :with => password
  click_button 'Log in'
end

def add_space(name, description, price)
  visit '/spaces/new'
  fill_in 'name', with: name
  fill_in 'description', with: description
  fill_in 'price', with: price
  click_button 'Submit'
end
