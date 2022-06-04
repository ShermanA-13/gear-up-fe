class BaseService
  class << self
    private

    def conn
      Faraday.new("https://gear-up-be.herokuapp.com")
    end

    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
