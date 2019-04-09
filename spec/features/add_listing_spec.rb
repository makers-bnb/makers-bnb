feature 'User can add listing' do
  scenario 'User goes to add listing page and submits form' do
    user_sign_up('test@gmail.com', '123')
    add_space "Bob's Bunker",
              'something loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong',
              '50'
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_content 'something loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong'
    expect(page).to have_content "50"
  end
end
