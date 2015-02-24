class AuthenticationController < ApplicationController

  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    email = request.env['omniauth.auth']['info']['email']
    auth_token = request.env['omniauth.auth']['credentials']['token']
    user = User.find_or_create_by(email: email)
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Thanks for logging in #{user.email}"
    else
      redirect_to root_path, notice: "Something went wrong"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
