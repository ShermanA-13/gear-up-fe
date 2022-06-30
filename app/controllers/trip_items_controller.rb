class TripItemsController < ApplicationController
  def new
    @trip_id = params[:trip_id]
    @items = ItemFacade.items(session[:user_id])
    @packed_items = ItemFacade.trip_items(session[:user_id], @trip_id)
  end

  def create
    TripFacade.add_items_to_trip(params[:trip_id], params[:items])
    redirect_to "/trips/#{params[:trip_id]}"
  end

  def update
    TripFacade.edit_items_on_trip(params[:trip_id], params[:items], params[:user_id])
    redirect_to "/trips/#{params[:trip_id]}"
  end
end
