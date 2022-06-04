class GearUpService
  def self.conn
    Faraday.new(url: "https://gear-up-be.herokuapp.com")
  end

  def self.user_trips(user_id)
    response = conn.get("/api/v1/users/#{user_id}/trips")
    JSON.parse(response.body, symbolize_names: true)
  end
end
