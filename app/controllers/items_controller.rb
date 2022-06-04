class ItemsController < ApplicationController
  def show
    @item = ItemFacade.find_item(params[:user_id], params[:id])
  end

  def index
    @items = ItemFacade.items(params[:user_id])
  end
end
