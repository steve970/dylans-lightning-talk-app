class AuthenticationController < ApplicationController
  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    email = request.env['omniauth.auth']['info']['email']
    name = request.env['omniauth.auth']['info']['name']
    auth_token = request.env['omniauth.auth']['credentials']['token']
    user = User.find_or_create_by(email: email, name: name)
    if user.present?
      session[:user_id] = user.id
      flash[:notice] = "Thanks for logging in #{user.email}"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
