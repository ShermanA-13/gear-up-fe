class UsersController < ApplicationController
  def show
  end

  def create
    auth_hash = request.env['omniauth.auth']
    session[:access_token] = auth_hash[:credentials][:token]
    UserService.create_user(auth_hash[:info])

    redirect_to "/login?email=#{auth_hash[:info][:email]}"
  end
end
