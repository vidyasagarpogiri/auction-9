class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path(current_user) if current_user
  end

  def create
    @user = User.find_by(email_address: params[:email_address])

    if @user && @user.authenticate(params[:password])
      flash.now[:notice] = "Successfully logged in as #{@user.first_name}!"
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      flash.now[:error] = 'Login failed, please try again.'
      render :new
    end
  end

  def destroy
    reset_session
    flash.now[:notice] = "You have successfully logged out."
    redirect_to root_path
  end
end
