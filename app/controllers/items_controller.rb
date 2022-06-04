class ItemsController < ApplicationController
  def show
    @item = GearUpFacade.find_item(params[:user_id], params[:id])
  end
end
