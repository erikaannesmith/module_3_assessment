require 'rails_helper'

describe "User searches stores by zipcode" do
  it "They see stores within 25 miles of zipcode" do
    visit '/'

    fill_in "zipcode", with: "80202"
    click_on "Search"

    expect(current_path).to eq('/search')
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_css(".store", count: 10)

    within(first(".store")) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.city')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.phone')
      expect(page).to have_css('.store-type')
    end
  end
end