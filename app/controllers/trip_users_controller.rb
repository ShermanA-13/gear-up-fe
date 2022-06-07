class TripUsersController < ApplicationController
  def new
    @trip = TripFacade.get_trip_by_id(params[:trip_id])
  end
end
