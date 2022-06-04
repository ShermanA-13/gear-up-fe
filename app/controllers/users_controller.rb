class UsersController < ApplicationController
  def show
    @user = GearUpFacade.find_user(params[:id])
    @items = GearUpFacade.items(params[:id])[0..2]
    @trips = GearUpFacade.user_trips(params[:id]).sort_by{|trip| trip.start_date}[0..1]
  end

  def index
    @users = GearUpFacade.users
  end
end
