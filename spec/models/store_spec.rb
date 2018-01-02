require 'rails_helper'

describe Store do
  it "has valid attributes" do
    store = Store.new(name: "UTICA MI",
                        city: "Utica",
                        distance: 7.43,
                        phone: "586-726-5400",
                        storeType: "Big Box")

    expect(store).to be_a(Store)
    expect(store).to have_attributes(name: "UTICA MI",
                                city: "Utica",
                                distance: 7.43,
                                phone: "586-726-5400",
                                store_type: "Big Box")
  end
end