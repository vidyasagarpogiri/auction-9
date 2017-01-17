class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)

    if @item.save
      flash.now[:notice] = 'You successfully added an item.'
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    return archive_item(@item) if params.include?("archive")

    @item.update(item_params)
    if @item.save
      flash.now[:notice] = 'You successfully added an item.'
      redirect_to dashboard_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.user_id == current_user.id
      @item.destroy
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'Auction item deleted'
    else
      flash.now[:notice] = 'Sorry, try again.'
      render :edit
    end
  end

  private

    def item_params
      params.require(:item).permit(:name,
                                   :description,
                                   :image,
                                   :retail_value,
                                   :delivery,
                                   :contact_name,
                                   :business_name,
                                   :address,
                                   :city,
                                   :state,
                                   :zip,
                                   :email,
                                   :phone)
    end

    def archive_item
      item.update_attribute(:archived, true)
      redirect_to dashboard_path(current_user)
    end
end
