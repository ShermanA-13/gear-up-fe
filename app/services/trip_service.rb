class TripService < BaseService
  def self.get_trip_by_id(id)
    response = conn.get("/api/v1/trips/#{id}")
    get_json(response)
  end

  def self.trips_by_user_id(user_id)
    response = conn.get("api/v1/users/#{user_id}/trips")
    get_json(response)
  end

  def self.get_all_trip_info(id)
    response = conn.get("/api/v1/trips/#{id}")
    get_json(response)
  end

  def self.create(parameters)
    response = conn.post "/api/v1/users/#{parameters[:user_id]}/trips", {
      name: (parameters[:name]),
      description: (parameters[:description]),
      start_date: (parameters[:start_date]),
      end_date: (parameters[:end_date]),
      user_id: (parameters[:user_id])
    }.to_json, "Content-Type" => "application/json"

    get_json(response)
  end

  def self.update_trip(id)
    response = conn.patch("/api/v1/trips/#{id}")
    get_json(response)
  end

  def self.delete_trip(id)
    response = conn.delete("/api/v1/trips/#{id}")
    get_json(response)
  end

  def self.add_items_to_trip(id, items)
    response = conn.post "/api/v1/trips/#{id}/items", {items: items}.to_json, "Content-Type" => "application/json"
    get_json(response)
  end

  def self.edit_items_on_trip(id, items)
    response = conn.patch "/api/v1/trips/#{id}/items", {items: items}.to_json, "Content-Type" => "application/json"
    get_json(response)
  end
end
