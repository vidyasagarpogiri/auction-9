class HomeController < ApplicationController
  def show
  end

  def index
    @items = Item.active
  end
end
