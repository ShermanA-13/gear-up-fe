class ItemsController < ApplicationController
  def show
    @item = ItemFacade.find_item(params[:user_id], params[:id])
    # @user = UserFacade.user(params[:user_id])
  end

  def index
    @items = ItemFacade.items(params[:user_id])
  end

  def new
    @user = UserFacade.user(params[:user_id])
  end

  def create
    item = ItemFacade.create(params)
    redirect_to "/users/#{item.user_id}/items/#{item.id}"
  end

  def destroy
    item = ItemFacade.destroy(params)
    redirect_to "/users/#{params[:user_id]}/items"
  end
end
