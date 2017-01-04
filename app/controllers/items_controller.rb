class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)
    if @item.save
      flash[:notice] = "You successfully added an item."
      redirect_to browse_path
    else
      render :new
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description)
    end

end
