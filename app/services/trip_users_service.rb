class TripUsersService < BaseService
  def self.create_trip_users(users, id)
    response = conn.post "/api/v1/trips/#{id}/users", {
      users: users
    }.to_json, 'Content-Type' => 'application/json'

    get_json(response)
  end

  def self.trip_user(id)
    response = conn.get("api/v1/trips/#{id}/users")

    get_json(response)
  end

  def self.edit_invitees(user_ids, id)
    response = conn.patch "/api/v1/trips/#{id}/users", {
      users: user_ids
    }.to_json, 'Content-Type' => 'application/json'

    get_json(response)
  end
end
