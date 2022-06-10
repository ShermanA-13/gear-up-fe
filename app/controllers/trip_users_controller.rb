class TripUsersController < ApplicationController
  def new
    @trip = TripFacade.get_trip_by_id(params[:trip_id])
    @users = UserFacade.users
  end

  def create
    TripUsersFacade.add_trip_users(params[:user_ids], params[:trip_id])
    @trip = TripFacade.get_trip_by_id(params[:trip_id])
    redirect_to "/trips/#{@trip.id}"
  end

  def index
    @trip_users = TripUsersFacade.trip_user(params[:trip_id])
  end

  def edit
    @users = UserFacade.users

    @invited = TripUsersFacade.trip_user(params[:trip_id])
    @trip = TripFacade.get_trip_by_id(params[:trip_id])
  end

  def update
    TripUsersFacade.edit_invitees(params[:user_ids], params[:trip_id])
    redirect_to "/trips/#{params[:trip_id]}"
  end

  def destroy
    TripUsersFacade.delete_trip_users(params[:user_ids], params[:trip_id])
    @trip = TripFacade.get_trip_by_id(params[:trip_id])
    redirect_to "/trips/#{@trip.id}"
  end
end
