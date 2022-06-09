class ItemService < BaseService
  class << self
    def find_item(user_id, item_id)
      response = conn.get("/api/v1/users/#{user_id}/items/#{item_id}")
      get_json(response)
    end

    def items(user_id)
      response = conn.get("/api/v1/users/#{user_id}/items/")
      get_json(response)
    end

    def create(parameters)
      response = conn.post "/api/v1/users/#{parameters[:user_id]}/items", {
        name: (parameters[:name]).to_s,
        description: (parameters[:description]).to_s,
        count: (parameters[:count]).to_s,
        category: (parameters[:category]).to_s,
        user_id: (parameters[:user_id]).to_s
      }.to_json, "Content-Type" => "application/json"

      get_json(response)
    end

    def update(parameters)
      response = conn.patch "/api/v1/users/#{parameters[:user_id]}/items/#{parameters[:id]}", {
        name: (parameters[:name]).to_s,
        description: (parameters[:description]).to_s,
        count: (parameters[:count]).to_s,
        category: (parameters[:category]).to_s,
        user_id: (parameters[:user_id]).to_s
      }.to_json, "Content-Type" => "application/json"

      get_json(response)
    end

    def destroy(parameters)
      response = conn.delete("/api/v1/users/#{parameters[:user_id]}/items/#{parameters[:id]}")
    end

    def find_trip_items(user_id, trip_id)
      response = conn.get("/api/v1/trips/#{trip_id}/items/#{user_id}")
      get_json(response)
    end
  end
end
