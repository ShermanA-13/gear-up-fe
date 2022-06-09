class WeatherFacade
  class << self
    def get_weather_by_area(area_id)
      json = WeatherService.get_weather_by_area(area_id)
      unless json[:weather].class == String
        json[:weather][:forecast].map do |forecast|
          Weather.new(forecast)
        end
      else
        Weather.new(json[:weather])
      end
    end
  end
end
