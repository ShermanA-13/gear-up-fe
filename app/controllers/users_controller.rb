class UsersController < ApplicationController
  def show
    @user = UserFacade.user(params[:id])

    if @user.class == User
      @items = ItemFacade.items(params[:id])[0..2]
      @trips = TripFacade.trips_by_user_id(params[:user_id]).sort_by{|trip| trip.start_date}[0..1]
    else
      @error = @user
    end

  end

  def index
    @users = UserFacade.users
  end

  def create
    auth_hash = request.env['omniauth.auth']
     session[:access_token] = auth_hash[:credentials][:token]
    user = UserFacade.create_user(auth_hash[:info])

    redirect_to "/login?user_id=#{user.id}&user_photo=#{user.user_photo}"
  end
end
