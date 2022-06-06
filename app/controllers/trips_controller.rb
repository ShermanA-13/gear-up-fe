class TripController < ApplicationController
  def show
    @trip = TripFacade.get_trip_by_id(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:id,
      :name, :location, :description, :start_date, :end_date)
  end
end
