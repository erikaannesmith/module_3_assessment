require 'rails_helper'

describe "Items request" do

  before :each do
    @items = create_list(:item, 3)
  end

  it "Can return json for all items" do
    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    expect(items.first["id"]).to eq(@items.first.id)
    expect(items.first["name"]).to eq(@items.first.name)
    expect(items.first["description"]).to eq(@items.first.description)
    expect(items.first["image_url"]).to eq(@items.first.image_url)
    expect(items.first["created_at"]).to be_nil
    expect(items.first["updated_at"]).to be_nil    
  end

  xit "Can return json for one item" do

  end

  xit "Can create an item" do

  end

  xit "Can delete an item" do

  end

end