class AreasController < ApplicationController
  def index
    if params[:name]
      @areas = AreaFacade.search(params[:name])
    end
  end

  def show
    @area = AreaFacade.get_area_by_id(params[:id])
  end
end
