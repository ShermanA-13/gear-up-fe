class TripUsersService < BaseService
  def self.create_trip_users(users, id)
    response = conn.post "/api/v1/trips/#{id}/users", {
      users: users
    }.to_json, "Content-Type" => "application/json"
    get_json(response)
  end
end
