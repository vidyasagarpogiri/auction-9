class SessionsController < ApplicationController
  def new
    return redirect_to admin_dashboard_index_path if current_user && admin?
    redirect_to dashboard_path(current_user) if current_user
  end

  def create
    @user = User.find_by(email_address: params[:email_address])

    if @user && @user.authenticate(params[:password])
      flash.now[:notice] = "Successfully logged in as #{@user.first_name}!"
      session[:user_id] = @user.id
      if admin?
        redirect_to admin_dashboard_index_path
      else
        redirect_to dashboard_path(@user)
      end
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
