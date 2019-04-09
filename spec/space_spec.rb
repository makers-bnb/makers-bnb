require 'space'

describe Space do
  it 'should store name, description and price in DB' do
    listing = Space.create(name: "Bob's Bunker", description: 'Come stay in my amazing bunker', price: '50')
    expect(listing.name).to eq "Bob's Bunker"
    expect(listing.description).to eq 'Come stay in my amazing bunker'
    expect(listing.price).to eq 50
  end
end
