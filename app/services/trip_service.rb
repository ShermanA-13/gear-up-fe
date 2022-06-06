class TripService < BaseService
  def self.get_trip_by_id(id)
    response = conn.get("/api/v1/trips/#{id}")
    get_json(response)
  end

  def self.trips_by_user_id(user_id)
    response = conn.get("api/v1/users/#{user_id}/trips")
    get_json(response)
  end
end
