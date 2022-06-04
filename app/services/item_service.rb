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
  end
end
