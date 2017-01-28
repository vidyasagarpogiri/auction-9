class Admin::SearchController < ApplicationController
  def index
    @items = Item.all
  end
end
