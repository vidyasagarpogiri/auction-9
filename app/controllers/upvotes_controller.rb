class UpvotesController < ApplicationController
  before_action :authenticate_user, only: [:edit]

  def edit
    item = Item.find(params[:id])

    item.liked_by current_user

    flash[:notice] = "#{item.name} upvoted!"
    redirect_to :back

  end

  private
    def authenticate_user
      unless current_user
        flash[:notice] = 'You must login to vote'
        redirect_to browse_path
      end
    end
end
