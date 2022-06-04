class ItemService < BaseService
  class << self
    def find_item(user_id, item_id)
      response = conn.get("/api/v1/users/#{user_id}/items/#{item_id}")
      JSON.parse(response.body, symbolize_names: true)
    end

    def items(user_id)
      response = conn.get("/api/v1/users/#{user_id}/items/")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
