class BaseService
  private

  def self.conn
    Faraday.new("**backend heroku app url**")
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
