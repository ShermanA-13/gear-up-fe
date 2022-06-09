class TripItemsController < ApplicationController

  def new
    @trip_id = params[:trip_id]
    @items = ItemFacade.items(params[:user_id])
    # require "pry"; binding.pry
  end

  def create
    # require "pry"; binding.pry
    TripFacade.add_items_to_trip(params[:trip_id], params[:items])
  end
end
