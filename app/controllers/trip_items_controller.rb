class TripItemsController < ApplicationController

  def new
    @trip_id = params[:trip_id]
    @items = ItemFacade.items(params[:user_id])
  end

  def create
    TripFacade.add_items_to_trip(params[:trip_id], params[:items])
    redirect_to "/trips/#{params[:trip_id]}"
  end
end
