class GearUpService
  def self.conn
    Faraday.new(url: "https://gear-up-be.herokuapp.com")
  end

  def self.find_item(user_id, item_id)
    response = conn.get("/api/v1/users/#{user_id}/items/#{item_id}")
    JSON.parse(response.body, symbolize_names: true)
  end
end