require 'rails_helper'

RSpec.describe "Authenticated User", :feature do
  before(:each) do
    @user = User.create first_name: "sally",
                       last_name: "mac",
                       email_address: "sally@sally.com",
                       password: "password",
                       password_confirmation: "password"

    @user2 = User.create first_name: "jack",
                       last_name: "black",
                       email_address: "jack@jack.com",
                       password: "password",
                       password_confirmation: "password"

    item = Item.create name: "Item 2",
                       description: "Item 2 description",
                       user_id: @user2.id
  end

  it "can view items they have added on dashboard page" do
    visit "/"
    # click_on "Sign up or Login"
    # fill_in "Email address", with: "sally@sally.com"
    # fill_in "Password", with: "password"
    # within "#login-form" do
      # click_on "Login"
    # end
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_path(@user)
    click_on "Add an Auction Item"
    fill_in "Name", with: "something cool"
    fill_in "Description", with: "something really cool that you should want"
    click_on "Add"

    visit dashboard_path(@user)

    expect(page).to have_content("something cool")
    expect(page).to_not have_content("Item 2")
    expect(page).to_not have_content("Item 2 description")
  end

end
