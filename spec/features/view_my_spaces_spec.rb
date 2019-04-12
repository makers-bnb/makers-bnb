feature 'User can view their spaces on myspaces' do
  before do
    user_sign_up('test@gmail.com', '123')
  end

  scenario 'User adds spaces and can see them on my spaces page' do
    user_sign_up('test@gmail.com', '123')
    add_space "Bob's Bunker",
              'This is the description of my bunker',
              '50',
              '2019-04-30',
              '2099-04-30'
    add_space "Bob's Shed",
              'This is the description of my shed',
              '50',
              '2019-04-30',
              '2099-04-30'
    click_link 'My spaces'
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_content "Bob's Shed"
  end
end
