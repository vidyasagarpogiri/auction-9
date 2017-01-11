class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)

    if @item.save
      flash.now[:notice] = 'You successfully added an item.'
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image)
    end
end
