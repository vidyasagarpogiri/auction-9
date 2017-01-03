require 'rails_helper'

RSpec.describe "Unauthenticated User", :feature do
  it "can browse auction items on home page" do
    create_items

    visit '/'

    click_on "Browse Auction Items"

    expect(page).to have_content(Item.first.name)
    expect(page).to have_content(Item.last.name)
  end

  def create_items
    user = User.create first_name: "sally",
                       last_name: "awesome",
                       email_address: "sally@sally.com",
                       password: "password",
                       password_confirmation: "password"

    10.times do
      Item.create name: Faker::Hipster.sentence(2),
                  description: Faker::Hipster.paragraph(2),
                  user_id: user.id
    end
  end
end
