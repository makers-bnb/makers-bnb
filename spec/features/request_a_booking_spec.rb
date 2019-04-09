require 'sign_up_create_space_sign_up_again_helper'

feature 'Request a booking' do
  scenario 'a user can visit the booking page for a space' do
    sign_up_create_space_sign_up_again
    visit '/spaces'
    click_link 'Request to book'
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_button "Request to book"
  end

  scenario "a user can request a booking for one night" do
    sign_up_create_space_sign_up_again
    visit '/spaces'
    click_link 'Request to book'
    fill_in 'booking_date', with: "2020-07-22"
    click_button 'Request to book'
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_content "2020-07-22"
    expect(page).to have_content "Pending"
  end

end