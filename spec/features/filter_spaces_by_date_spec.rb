feature 'User can filter spaces by date' do
  scenario 'a user can visit the space page, input a date range and only see avialable proprerites' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Paul's Bunker", 'My bunker is amazing', '50', '2019-04-01', '2019-04-10')
    add_space("Paul's Shed", 'My shed is amazing', '40', '2019-04-05', '2019-04-10')
    add_space("Paul's Tent", 'My tent is amazing', '30', '2019-04-11', '2019-04-15')
    user_sign_up('billyrenter@renters.com', 'love2rent')
    visit '/spaces'
    fill_in 'start_date', with: '2019-04-01'
    fill_in 'end_date', with: '2019-04-10'
    click_button 'Filter'
    expect(page).to have_content "Paul's Bunker"
    expect(page).to have_content "Paul's Shed"
    expect(page).to_not have_content "Paul's Tent"
  end
  scenario 'a user can clear their filter' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Paul's Bunker", 'My bunker is amazing', '50', '2019-04-01', '2019-04-10')
    add_space("Paul's Shed", 'My shed is amazing', '40', '2019-04-05', '2019-04-10')
    add_space("Paul's Tent", 'My tent is amazing', '30', '2019-04-11', '2019-04-15')
    user_sign_up('billyrenter@renters.com', 'love2rent')
    visit '/spaces'
    fill_in 'start_date', with: '2019-04-01'
    fill_in 'end_date', with: '2019-04-10'
    click_button 'Filter'
    click_button 'Clear'
    expect(page).to have_content "Paul's Bunker"
    expect(page).to have_content "Paul's Shed"
    expect(page).to have_content "Paul's Tent"
  end
end
