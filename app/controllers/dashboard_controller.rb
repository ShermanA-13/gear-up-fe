class DashboardController < ApplicationController
  def show
    @user = UserFacade.user(session[:user_id])
    @items = ItemFacade.items(session[:user_id])[0..2]
    @trips = GearUpFacade.user_trips(session[:user_id]).sort_by{|trip| trip.start_date}[0..1]
  end
end
