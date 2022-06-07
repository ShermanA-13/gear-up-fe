class TripsController < ApplicationController
  def new
    @area = AreaFacade.get_area_by_id(params[:id])
  end

  def show
    @trip = TripFacade.get_trip_by_id(params[:id])
  end

  def index
    @trips = TripFacade.trips_by_user_id(params[:user_id])
  end

  def create
    TripFacade.create_trip(params)

    # @area = AreaFacade.get_area_by_id(params[:id])
    # redirect_to "/areas/#{@area.id}/trips/new/users"
  end

  def update
    trip = TripFacade.update(params)
    redirect_to "/trips/#{trip.id}"
  end
end
