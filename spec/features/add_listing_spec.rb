feature 'User can add listing' do
  scenario 'User goes to add listing page and submits form' do
    visit '/spaces/new'
    fill_in 'name', with: "Bob's Bunker"
    fill_in 'description', with: "Spend a lavish night in my luxury renovated nuclear bunker!"
    fill_in 'price', with: "50"
    click_button 'Submit'
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_content "Spend a lavish night in my luxury renovated nuclear bunker!"
    expect(page).to have_content "50"
  end
end
