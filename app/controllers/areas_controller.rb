class AreasController < ApplicationController
  def index
    if params[:name]
      @areas = AreaFacade.search(params[:name])
      if @areas.class == Error
        flash[:alert] = @areas.message
        @areas = []
      end
    end
  end

  def show
    @area = AreaFacade.get_area_by_id(params[:id])
    if @area.class == Error
      @error = @area
    else
      @weather = WeatherFacade.get_weather_by_area(params[:id])
    end
  end
end
