require 'rails_helper'

RSpec.describe "Unauthenticated User", :feature do
  it "can browse auction items on home page" do
    visit '/'

    click_on "Browse Auction Items"

    10.times do
      count = 1
      expect(page).to have_content(Item.find(count).name)
      count += 1
    end
  end
end
