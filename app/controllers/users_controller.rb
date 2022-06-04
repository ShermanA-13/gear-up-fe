class UsersController < ApplicationController
  def show
    @user = GearUpFacade.find_user(params[:id])
  end
end
