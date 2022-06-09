class TripUserService < BaseService
  def self.get_trip_users(id)
    response = conn.get("/api/v1/trips/#{id}/users")
    get_json(response)
  end

  def self.edit_invitees(users, id)
    response = conn.patch("api/v1/trips#{id}/users")
    get_json(respone)
  end
end
