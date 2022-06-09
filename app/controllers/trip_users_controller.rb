class TripUsersController < ApplicationController
<<<<<<< HEAD
  def new
    @trip = TripFacade.get_trip_by_id(params[:trip_id])
    @users = UserFacade.users
  end

  def create
    TripUsersFacade.add_trip_users(params[:user_ids], params[:trip_id])

    @trip = TripFacade.get_trip_by_id(params[:trip_id])
    redirect_to "/trips/#{@trip.id}"
  end
=======
>>>>>>> e5d15df (feat: trip_users controller, services and routes)
end
