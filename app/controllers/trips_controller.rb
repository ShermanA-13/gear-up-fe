class TripsController < ApplicationController
  def new
  end

  def show
    @trip = TripFacade.get_all_trip_info(params[:id])
    # require "pry"; binding.pry
  end

  def index
    @trips = TripFacade.trips_by_user_id(params[:user_id])
  end

  def create
    trip = TripFacade.create(params)

    redirect_to "/users/#{trip.user_id}/trips/#{trip.id}"
  end

  def update
    trip = TripFacade.update(params)
    redirect_to "/trips/#{trip.id}"
  end
end
