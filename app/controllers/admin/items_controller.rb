class Admin::ItemsController < ApplicationController
  before_action :authorize_admin
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      flash.now[:notice] = 'You successfully added an item.'
      redirect_to admin_dashboard_index_path
    else
      render :new
      flash.now[:notice] = @item.errors.full_messages.join(", ")
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    return archive_item(@item, params[:archive]) if params.include?("archive")
    @item.update(item_params)
    if @item.save
      flash.now[:notice] = 'You successfully updated #{@item.name}.'
      redirect_to admin_dashboard_index_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,
                                 :user_id,
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

  def archive_item(item, archive)
    item.update_attribute(:archived, archive)
    if params.include?("user_dash")
      redirect_to admin_user_path(params[:user_dash])
    else
      redirect_to admin_dashboard_index_path
    end
  end
end
