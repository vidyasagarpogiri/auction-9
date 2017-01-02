require 'rails_helper'

RSpec.describe "Authenticated User", :feature do
  it "can login" do
    user = User.create first_name: "sally", 
                       last_name: "mac",
                       email_address: "sally@sally.com",
                       password: "password",
                       password_confirmation: "password"

    visit "/"
    click_on "Sign up or Login"
    fill_in "Email address", with: "sally@sally.com"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content("Welcome, sally")
  end
end
