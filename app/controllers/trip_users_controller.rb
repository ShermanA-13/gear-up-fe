class TripUsersController < ApplicationController
<<<<<<< HEAD
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
=======
  # def index
  # @users = TripUserFacade.
  # end
  #
  # def create
  #   @trip = trip.create(trip_params)
  #    if @trip.save
  #     TripUser.create(user_id: current_user.id, trip_id: @trip.id, is_host: true)
  #     friend_ids.each { |id| TripUser.create(user_id: id, trip_id: @trip.id, is_host: false) } if friend_ids
  #     redirect_to landing_path
  #   else
  #     redirect_to
  #
  # end
>>>>>>> f3a179c (rebase)
end
