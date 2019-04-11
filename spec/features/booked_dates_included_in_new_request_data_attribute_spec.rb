feature 'Booked dates are unavailable' do
  scenario "Dates which are already booked should appear in a data attribute on the date picker" do
    user_sign_up('landlord@landlord', 'password')
    add_space('My flat', 'Is a very nice flat', '99', '2020-01-01', '2020-12-31')
    click_button('Log out')

    user_sign_up('renter@renter', 'password')
    make_request('2020-05-03')
    make_request('2020-06-03')
    make_request('2020-07-03')
    click_button('Log out')

    user_log_in('landlord@landlord', 'password')
    click_link('Requests')
    page.find('#requests-on-my-listings div.request-date', text: '2020-05-03')
        .ancestor('.request')
        .find('button', text: 'Accept booking')
        .click
    page.find('#requests-on-my-listings div.request-date', text: '2020-07-03')
        .ancestor('.request')
        .find('button', text: 'Accept booking')
        .click
    click_button('Log out')

    user_sign_up('renter2@renter', 'password')
    click_link('Request to book')
    expect(page).to have_selector('#request_date_picker[data-booked-dates="2020-05-03 2020-07-03"]')
  end

  scenario "Pending requests are not included" do
    user_sign_up('landlord@landlord', 'password')
    add_space('My flat', 'Is a very nice flat', '99', '2020-01-01', '2020-12-31')
    click_button('Log out')

    user_sign_up('renter@renter', 'password')
    make_request('2020-05-03')
    make_request('2020-06-03')
    make_request('2020-07-03')
    click_button('Log out')

    user_log_in('landlord@landlord', 'password')
    click_link('Requests')
    page.find('#requests-on-my-listings div.request-date', text: '2020-05-03')
        .ancestor('.request')
        .find('button', text: 'Accept booking')
        .click
    click_button('Log out')

    user_sign_up('renter2@renter', 'password')
    click_link('Request to book')
    expect(page).to have_selector('#request_date_picker[data-booked-dates="2020-05-03"]')
  end

  scenario "Rejected requests are not included" do
    user_sign_up('landlord@landlord', 'password')
    add_space('My flat', 'Is a very nice flat', '99', '2020-01-01', '2020-12-31')
    click_button('Log out')

    user_sign_up('renter@renter', 'password')
    make_request('2020-05-03')
    make_request('2020-06-03')
    make_request('2020-07-03')
    click_button('Log out')

    user_log_in('landlord@landlord', 'password')
    click_link('Requests')
    page.find('#requests-on-my-listings div.request-date', text: '2020-07-03')
        .ancestor('.request')
        .find('button', text: 'Reject booking')
        .click
    click_button('Log out')

    user_log_in('landlord@landlord', 'password')
    click_link('Requests')
    page.find('#requests-on-my-listings div.request-date', text: '2020-05-03')
        .ancestor('.request')
        .find('button', text: 'Accept booking')
        .click
    click_button('Log out')

    user_sign_up('renter2@renter', 'password')
    click_link('Request to book')
    expect(page).to have_selector('#request_date_picker[data-booked-dates="2020-05-03"]')
  end
end
