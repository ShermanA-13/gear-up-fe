class AreasController < ApplicationController
  def index
    if params[:name]
      @areas = AreaFacade.search(params[:name])
    end
  end

  def show
    @area = AreaFacade.area(params[:id])
    if session[:user_id]
      @user = UserFacade.user(session[:user_id])
    end
  end
end
