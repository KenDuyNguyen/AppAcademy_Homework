class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.new[:errors] = ["Incorrect email and/or password"]
      render :new
    else
      login_user!(user)
      redirect_to user_url
    end
  end

  def destory
    logout_user!
    redirect_to new_session_url
  end

end
