require 'rails_helper'

RSpec.describe "Authenticated User", :feature do
  before(:each) do
    user = User.create first_name: "sally",
                       last_name: "mac",
                       email_address: "sally@sally.com",
                       password: "password",
                       password_confirmation: "password"
  end

  it "can login" do
    visit "/"
    click_on "Donate items to the auction"
    fill_in "Email address", with: "sally@sally.com"
    fill_in "Password", with: "password"
    within "#login-form" do
      click_on "Login"
    end

    expect(page).to have_content("Welcome, sally")
  end

  it "can logout" do
    visit "/"
    click_on "Sign up or Login"
    fill_in "Email address", with: "sally@sally.com"
    fill_in "Password", with: "password"
    within "#login-form" do
      click_on "Login"
    end

    expect(page).to have_content("Logout")

    click_on "Logout"
    expect(page).to have_content("You have successfully logged out")

  end
end
