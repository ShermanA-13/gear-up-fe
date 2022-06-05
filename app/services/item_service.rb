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
        name: "#{parameters[:name]}",
        description: "#{parameters[:description]}",
        count: "#{parameters[:count]}",
        category: "#{parameters[:category]}",
        user_id: "#{parameters[:user_id]}"
      }.to_json, "Content-Type" => "application/json"

      get_json(response)
    end
  end
end
