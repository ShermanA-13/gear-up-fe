class TripsController < ApplicationController
  def new
    @area = AreaFacade.get_area_by_id(params[:area_id])
  end

  def show
    @trip = TripFacade.get_all_trip_info(params[:id])
    @error = @trip if @trip.instance_of?(Error)
  end

  def index
    @trips = TripFacade.trips_by_user_id(params[:user_id])
    @error = @trips if @trips.instance_of?(Error)
  end

  def create
    @trip = TripFacade.create_trip(params)
    @area = AreaFacade.get_area_by_id(params[:area_id])
    if @trip.instance_of?(Error)
      @error = @trip
      flash[:success] = @error.message
      redirect_to "/areas/#{@area.id}/trips/new"
    elsif @area.instance_of?(Error)
      @error = @area
    else
      redirect_to "/areas/#{@area.id}/trips/#{@trip.id}/users/new"
    end
  end

  def update
    @trip = TripFacade.get_all_trip_info(params[:id])
    @updated_trip = TripFacade.update(params)
    if @updated_trip.instance_of?(Error)
      flash[:notice] = @updated_trip.message
      render :edit
    elsif @trip.instance_of?(Error)
      @error = @trip
    else
      redirect_to "/trips/#{@trip.id}"
    end
  end

  def edit
    @trip = TripFacade.get_all_trip_info(params[:id])
    @error = @trip if @trip.instance_of?(Error)
  end

  def destroy
    TripFacade.destroy(params[:id])
    redirect_to '/dashboard'
  end
end
