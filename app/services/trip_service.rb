class TripService < BaseService
  def self.get_trip_by_id(id)
    response = conn.get("/api/v1/trips/#{id}/info")
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
      name: (parameters[:name]).to_s,
      description: parameters[:description].to_s,
      start_date: parameters[:start_date].to_s,
      end_date: parameters[:end_date].to_s,
      area_id: parameters[:area_id].to_s
    }.to_json, "Content-Type" => "application/json"
    get_json(response)
  end

  def self.update_trip(params)
    response = conn.patch "/api/v1/trips/#{params[:id]}", {
      name: (params[:name]).to_s,
      start_date: (params[:start_date]).to_s,
      end_date: (params[:end_date]).to_s,
      description: (params[:description]).to_s
    }.to_json, "Content-Type" => "application/json"
    get_json(response)
  end

  def self.delete_trip(id)
    response = conn.delete("/api/v1/trips/#{id}")
    get_json(response)
  end
end
