require 'space'

describe Space do

  before(:each) do
    @user1 = User.create(email: 'email1', password: 'password')
    @user2 = User.create(email: 'email2', password: 'password')
  end

  it 'should store name, description and price in DB' do
    listing = Space.create(name: "Bob's Bunker", description: 'Come stay in my amazing bunker', price: '50', start_date: '2019-04-01', end_date: '2019-04-10', user: @user1)
    get_listing = Space.first(name: "Bob's Bunker")
    expect(listing.name).to eq get_listing.name
    expect(listing.description).to eq get_listing.description
    expect(listing.price).to eq get_listing.price
  end
  describe '.filter_spaces' do
    it 'should return only spaces between the date range given' do
      Space.create(name: "Paul's Bunker", description: 'Come stay in my amazing bunker', price: '50', start_date: '2019-04-01', end_date: '2019-04-10', user: @user1)
      Space.create(name: "Paul's Shed", description: 'Come stay in my amazing shed', price: '40', start_date: '2019-04-11', end_date: '2019-04-15', user: @user1)
      spaces1 = Space.filter_spaces('2019-04-01', '2019-04-04', @user2)
      expect(spaces1.length).to eq 1
      expect(spaces1[0].name).to eq "Paul's Bunker"
      spaces2 = Space.filter_spaces('2019-04-01', '2019-04-12', @user2)
      expect(spaces2.length).to eq 2
      spaces3 = Space.filter_spaces('2019-04-12', '2019-04-30', @user2)
      expect(spaces3.length).to eq 1
      expect(spaces3[0].name).to eq "Paul's Shed"
    end
    it 'should return return all spaces if date inputs are both nil' do
      Space.create(name: "Paul's Bunker", description: 'Come stay in my amazing bunker', price: '50', start_date: '2019-04-01', end_date: '2019-04-10', user: @user1)
      Space.create(name: "Paul's Shed", description: 'Come stay in my amazing shed', price: '40', start_date: '2019-04-11', end_date: '2019-04-15', user: @user1)
      spaces1 = Space.filter_spaces(nil, nil, @user2)
      expect(spaces1.length).to eq 2
    end
    it 'should return return all spaces if date inputs are both empty strings' do
      Space.create(name: "Paul's Bunker", description: 'Come stay in my amazing bunker', price: '50', start_date: '2019-04-01', end_date: '2019-04-10', user: @user1)
      Space.create(name: "Paul's Shed", description: 'Come stay in my amazing shed', price: '40', start_date: '2019-04-11', end_date: '2019-04-15', user: @user1)
      spaces1 = Space.filter_spaces('', '', @user2)
      expect(spaces1.length).to eq 2
    end
    it 'should not return spaces belonging to user' do
      Space.create(name: "Paul's Bunker", description: 'Come stay in my amazing bunker', price: '50', start_date: '2019-04-01', end_date: '2019-04-10', user: @user1)
      Space.create(name: "Paul's Shed", description: 'Come stay in my amazing shed', price: '40', start_date: '2019-04-11', end_date: '2019-04-15', user: @user1)
      spaces1 = Space.filter_spaces('', '', @user1)
      expect(spaces1.length).to eq 0
    end
  end
end
