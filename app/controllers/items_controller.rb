class ItemsController < ApplicationController
  def show
    @item = ItemFacade.find_item(params[:user_id], params[:id])
    unless @item.class == Item
      @error = @item
    end
  end

  def index
    @items = ItemFacade.items(params[:user_id])
    unless @items.class == Array
      @error = @items
    end
  end

  def new
    @user = UserFacade.user(params[:user_id])
    unless @user.class == User
      @error = @user
    end
  end

  def create
    item = ItemFacade.create(params)
    redirect_to "/users/#{item.user_id}/items/#{item.id}"
  end

  def destroy
    if session[:user_id] == params[:user_id]
      item = ItemFacade.destroy(params)
      redirect_to "/users/#{params[:user_id]}/items"
    else
      redirect_to "/users/#{params[:user_id]}/items"
    end
  end

  def edit
    @item = ItemFacade.find_item(params[:user_id], params[:id])
    @user = UserFacade.user(params[:user_id])
  end

  def update
    item = ItemFacade.update(params)
    redirect_to "/users/#{item.user_id}/items/#{item.id}"
  end

end
