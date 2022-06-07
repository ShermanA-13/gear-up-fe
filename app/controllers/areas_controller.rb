class AreasController < ApplicationController
  def index
    if params[:name]
      @areas = AreaFacade.search(params[:name])
    end
  end

  def show
    # @area = AreaFacade.area(params[:id])
  end
end
