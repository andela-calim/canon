class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])#TODO set up environment in .env file
    session[:user_id] = user.id
    redirect_to root_path, notice: "login successfull"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "logout successfull"
  end

end
