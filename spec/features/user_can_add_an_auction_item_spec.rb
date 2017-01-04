require 'rails_helper'

RSpec.describe "Authenticated User", :feature do
  before(:each) do
    user = User.create first_name: "sally",
                       last_name: "mac",
                       email_address: "sally@sally.com",
                       password: "password",
                       password_confirmation: "password"
  end

  it "can add an auction item from dashboard page" do
    visit "/"
    click_on "Sign up or Login"
    fill_in "Email address", with: "sally@sally.com"
    fill_in "Password", with: "password"
    within "#login-form" do
      click_on "Login"
    end

    click_on "Add an Auction Item"
    fill_in "Name", with: "something cool"
    fill_in "Description", with: "something really cool that you should want"
    click_on "Add"

    expect(current_path).to eq(browse_path)
    expect(page).to have_content("You successfully added an item.")
    expect(page).to have_content("something cool")
  end

end
