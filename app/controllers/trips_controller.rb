class TripsController < ApplicationController
  def new
    @area = AreaFacade.get_area_by_id(params[:area_id])
  end

  def show
    @trip = TripFacade.get_all_trip_info(params[:id])
    if @trip.class == Error
      @error = @trip
    end
  end

  def index
    @trips = TripFacade.trips_by_user_id(params[:user_id])
  end

  def create
    @trip = TripFacade.create_trip(params)

    @area = AreaFacade.get_area_by_id(params[:area_id])
    redirect_to "/areas/#{@area.id}/trips/#{@trip.id}/users/new"
  end

  def update
    @trip = TripFacade.update(params)
    redirect_to "/trips/#{@trip.id}"
  end

  def edit
    @trip = TripFacade.get_all_trip_info(params[:id])
  end

  def destroy
    TripFacade.destroy(params[:id])
    redirect_to "/dashboard"
  end
end
