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

  it "Can return json for one item" do
    get "/api/v1/items/#{@items.first.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(@items.first.id)
    expect(item["name"]).to eq(@items.first.name)
    expect(item["description"]).to eq(@items.first.description)
    expect(item["image_url"]).to eq(@items.first.image_url)
    expect(item["created_at"]).to be_nil
    expect(item["updated_at"]).to be_nil  
  end

  it "Can create an item" do
    post "/api/v1/items", :params => {name: "Item 1",
                           description: "Item 1 things",
                           image_url: "www.example.com"}

    expect(response.status).to eq(201) 
    item = JSON.parse(response.body)

    expect(item["name"]).to eq("Item 1")
    expect(item["description"]).to eq("Item 1 things")
    expect(item["image_url"]).to eq("www.example.com")
    expect(item["created_at"]).to be_nil
    expect(item["updated_at"]).to be_nil
  end

  it "Can delete an item" do
    delete "/api/v1/items/#{@items.first.id}"

    expect(response.status).to eq(204)
  end

end