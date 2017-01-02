class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in as #{@user.first_name}!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Login failed, please try again."
      render :new
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end
end
