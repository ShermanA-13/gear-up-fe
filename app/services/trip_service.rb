class TripService
  def self.conn
    Faraday.new(url: "http://localhost:3000/api/v1/")
    # url = ENV['gear-up-be']
    # Faraday.new(url: url)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_trip_by_id(id)
    response = conn.get("/api/v1/trips/#{id}")
    parse_json(response)
  end

  def trips_by_user_id(id)
    response = conn.get("api/v1/users/#{user_id}/trips")
    parse_json(response)
  end
end
