class TripUsersService < BaseService
  def self.create_trip_users(users, id)
    response = conn.post "/api/v1/trips/#{id}/users", {
      users: users
    }.to_json, "Content-Type" => "application/json"
    get_json(response)
  end

  def self.edit_invitees(users, id)
    response = conn.patch("api/v1/trips#{id}/users")
    get_json(respone)
  end
end
