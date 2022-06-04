class ItemsController < ApplicationController
  def show
    @item = GearUpFacade.find_item(params[:user_id], params[:id])
  end

  def index
    @items = GearUpFacade.items(params[:user_id])
  end
end
