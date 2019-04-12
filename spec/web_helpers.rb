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

def add_space(name, description, price, start_date = '2019-04-20', end_date = '2099-04-20')
  visit '/spaces'
  click_link "Add a new listing"
  fill_in 'name', with: name
  fill_in 'description', with: description
  fill_in 'price', with: price
  fill_in 'start_date', with: start_date
  fill_in 'end_date', with: end_date
  click_button 'Submit'
end

def make_request(date)
  visit '/spaces'
  click_link 'Request to book'
  fill_in 'booking_date', with: date
  click_button 'Request to book'
end
