class ItemsController < ApplicationController
  def show
    @user = UserFacade.user(params[:user_id])
    @item = ItemFacade.find_item(params[:user_id], params[:id])
    @error = @item unless @item.instance_of?(Item)
  end

  def index
    @user = UserFacade.user(params[:user_id])
    @items = ItemFacade.items(params[:user_id])
    @error = @items unless @items.instance_of?(Array)
  end

  def new
    @user = UserFacade.user(params[:user_id])
    @error = @user unless @user.instance_of?(User)
  end

  def create
    item = ItemFacade.create(params)
    if item.instance_of?(Item)
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
    if item.instance_of?(Error)
      flash[:notice] = item.message
      redirect_to "/users/#{params[:user_id]}/items/#{params[:id]}/edit"
    else
      redirect_to "/users/#{item.user_id}/items/#{item.id}"
    end
  end
end
