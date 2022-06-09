<<<<<<< HEAD
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

  def self.destroy(id)
    response = conn.delete("/api/v1/trips/#{id}")
  end

  def self.add_items_to_trip(id, items)
    response = conn.post "/api/v1/trips/#{id}/items", {items: items}.to_json, "Content-Type" => "application/json"
    get_json(response)
  end

  def self.edit_items_on_trip(id, items)
    response = conn.patch "/api/v1/trips/#{id}/items", {items: items}.to_json, "Content-Type" => "application/json"
    get_json(response)
=======
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
>>>>>>> 44e9de7 (merged main with branch rebase: routes)
  end
end
