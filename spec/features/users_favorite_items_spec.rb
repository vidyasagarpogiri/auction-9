require 'rails_helper'

RSpec.describe "User", :feature do
  # before(:each) do
    # @user = User.create first_name: "sally",
                       # last_name: "mac",
                       # email_address: "sally@sally.com",
                       # password: "password",
                       # password_confirmation: "password"

    # @user2 = User.create first_name: "jack",
                       # last_name: "black",
                       # email_address: "jack@jack.com",
                       # password: "password",
                       # password_confirmation: "password"

    # item = Item.create name: "Item 2",
                       # description: "Item 2 description",
                       # user_id: @user2.id
  # end

  # it "cannot favorite item if not logged in" do
    # visit browse_path

    # expect(page).to_not have_selector("#unfavorite")
    # find(:css, '#favorite').click

    # expect(page).to have_content("You must login to favorite")

  # end

  # it "can favorite items when logged in" do
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    # visit browse_path
    # find(:css, '#favorite').click
    # expect(page).to have_selector("#unfavorite")
    # expect(page).to_not have_selector("#favorite")

    # find(:css, '#unfavorite').click
    # expect(page).to have_selector("#favorite")
  # end
end
