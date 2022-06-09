class WeatherService < TripService
  class << self
    def get_weather_by_area(area_id)
      response = conn.get("/api/v1/areas/#{area_id}/weather")
      get_json(response)
    end
  end
end
