class Admin::DashboardController < ApplicationController
  before_action :authorize_admin
  def index
    @active = Item.all.active
    @archived = Item.all.archived
  end
end
