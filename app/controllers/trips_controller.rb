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
    if @trips.class == Error
      @error = @trips
    end
  end

  def create
    @trip = TripFacade.create_trip(params)
    @area = AreaFacade.get_area_by_id(params[:area_id])
    if @trip.class == Error
      @error = @trip
      flash[:success] = @error.message
      redirect_to "/areas/#{@area.id}/trips/new"
    elsif @area.class == Error
      @error = @area
    else
      redirect_to "/areas/#{@area.id}/trips/#{@trip.id}/users/new"
    end
  end

  def update
    @trip = TripFacade.get_all_trip_info(params[:id])
    @updated_trip = TripFacade.update(params)
    if @updated_trip.class == Error
      flash[:notice] = @updated_trip.message
      render :edit
    elsif @trip.class == Error
      @error = @trip
    else
      redirect_to "/trips/#{@trip.id}"
    end
  end

  def edit
    @trip =  TripFacade.get_all_trip_info(params[:id])
    if @trip.class == Error
      @error = @trip
    end
  end

  def destroy
    TripFacade.destroy(params[:id])
    redirect_to "/dashboard"
  end
end
