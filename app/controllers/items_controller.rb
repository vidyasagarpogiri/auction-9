class ItemsController < ApplicationController
  before_action :set_item, except: [:new, :create]
  before_action :authorize_user, except: [:new, :create, :show]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)

    if @item.save
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'You successfully added an item.'
    else
      flash.now[:error] = @item.errors.full_messages.join(", ")
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
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'You successfully updated #{@item.name}.'
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

    def archive_item(item)
      item.update_attribute(:archived, true)
      redirect_to dashboard_path(current_user)
    end

  def authorize_user
    unless current_user.id == @item.user.id
      redirect_to dashboard_path(current_user)
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
