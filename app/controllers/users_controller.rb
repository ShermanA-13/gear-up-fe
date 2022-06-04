class UsersController < ApplicationController
  def show
    @user = GearUpFacade.find_user(params[:id])
  end

  def index
    @users = GearUpFacade.users
  end
end
