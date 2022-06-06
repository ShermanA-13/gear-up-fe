class TripsController < ApplicationController
  def new
  end

  def show
    @trip = TripFacade.get_trip_by_id(params[:id])
  end
end
