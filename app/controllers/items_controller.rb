class ItemsController < ApplicationController
  def show
    @user = UserFacade.user(params[:user_id])
    @item = ItemFacade.find_item(params[:user_id], params[:id])
    unless @item.instance_of?(Item)
      @error = @item
    end
  end

  def index
    @user = UserFacade.user(params[:user_id])
    @items = ItemFacade.items(params[:user_id])
    unless @items.instance_of?(Array)
      @error = @items
    end
  end

  def new
    @user = UserFacade.user(params[:user_id])
    unless @user.instance_of?(User)
      @error = @user
    end
  end

  def create
    item = ItemFacade.create(params)
    if item.class == Item
      redirect_to "/users/#{item.user_id}/items/#{item.id}"
    else
      flash[:alert] = item.message
      redirect_to "/users/#{current_user.id}/items/new"
    end
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
