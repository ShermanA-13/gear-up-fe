class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def create
    auth_hash = request.env['omniauth.auth']
    session[:access_token] = auth_hash[:credentials][:token]
    user = UserFacade.create_user(auth_hash[:info])

    redirect_to "/login?user_id=#{user.id}"
  end
end
