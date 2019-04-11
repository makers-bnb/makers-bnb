feature 'User can add listing' do
  before do
    user_sign_up('test@gmail.com', '123')
  end

  scenario 'User goes to add listing page and submits form' do
    user_sign_up('test@gmail.com', '123')
    add_space "Bob's Bunker",
              'This is the description of my flat',
              '50',
              '2019-04-30',
              '2099-04-30'
    expect(page).to have_content "New listing created"
    expect(page).to have_content "Bob's Bunker"
    expect(page).to have_content 'This is the description of my flat'
    expect(page).to have_content "50"
  end

  scenario "It doesn't create the space if the user leaves out name" do
    add_space '',
              'This is the description of my flat',
              '50',
              '2019-04-30',
              '2099-04-30'
    expect(page).to have_content "Could not create listing"
    click_link "Spaces"
    expect(page).not_to have_content "Bob's Bunker"
    expect(page).not_to have_content 'This is the description of my flat'
    expect(page).not_to have_content "50"
  end

  scenario "It doesn't create the space if the user leaves out description" do
    add_space "Bob's Bunker",
              '',
              '50',
              '2019-04-30',
              '2099-04-30'
    expect(page).to have_content "Could not create listing"
    click_link "Spaces"
    expect(page).not_to have_content "Bob's Bunker"
    expect(page).not_to have_content 'This is the description of my flat'
    expect(page).not_to have_content "50"
  end

  scenario "It doesn't create the space if the user leaves out price" do
    add_space "Bob's Bunker",
              'This is the description of my flat',
              '',
              '2019-04-30',
              '2099-04-30'
    expect(page).to have_content "Could not create listing"
    click_link "Spaces"
    expect(page).not_to have_content "Bob's Bunker"
    expect(page).not_to have_content 'This is the description of my flat'
    expect(page).not_to have_content "50"
  end

  scenario "It doesn't create the space if the user leaves out start date" do
    add_space "Bob's Bunker",
              'This is the description of my flat',
              '50',
              '',
              '2099-04-30'
    expect(page).to have_content "Could not create listing"
    click_link "Spaces"
    expect(page).not_to have_content "Bob's Bunker"
    expect(page).not_to have_content 'This is the description of my flat'
    expect(page).not_to have_content "50"
  end

  scenario "It doesn't create the space if the user leaves out end date" do
    add_space "Bob's Bunker",
              'This is the description of my flat',
              '50',
              '2019-04-30',
              ''
    expect(page).to have_content "Could not create listing"
    click_link "Spaces"
    expect(page).not_to have_content "Bob's Bunker"
    expect(page).not_to have_content 'This is the description of my flat'
    expect(page).not_to have_content "50"
  end
end
