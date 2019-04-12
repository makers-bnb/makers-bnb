feature 'User cannot see their own spaces in spaces page' do
  scenario 'a user can add spaces and does not see them listed in spaces page' do
    user_sign_up('johnnylandlord@landlords.com', 'moneymoneymoney')
    add_space("Paul's Bunker", 'My bunker is amazing', '50', '2019-04-01', '2019-04-10')
    add_space("Paul's Shed", 'My shed is amazing', '40', '2019-04-05', '2019-04-10')
    add_space("Paul's Tent", 'My tent is amazing', '30', '2019-04-11', '2019-04-15')
    visit '/spaces'
    expect(page).not_to have_content "Paul's Bunker"
    expect(page).not_to have_content "Paul's Shed"
    expect(page).not_to have_content "Paul's Tent"
  end
end
