class TripService < BaseService
  def get_trip_by_id(id)
    response = conn.get("/api/v1/trips/#{id}")
    get_json(response)
  end

  def trips_by_user_id(id)
    response = conn.get("api/v1/users/#{user_id}/trips")
    get_json(response)
  end
end
