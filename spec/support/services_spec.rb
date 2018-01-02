require 'rails_helper'

describe "Services" do
  it "Best buy service returns json for all stores by zip" do
    response = BestBuyService.new.all_by_zipcode("48094")

    expect(response[:stores].count).to eq(10)
    expect(response[:total]).to eq(12)
  end

  it "Store search service returns store count and stores" do
    response = StoreSearchService.new("48094")

    expect(response.zip).to eq("48094")
    expect(response.store_count).to eq(12)
    expect(response.stores.first.name).to eq("UTICA MI")
  end
end