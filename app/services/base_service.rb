class BaseService
  class << self
    private

    def conn

      if ENV["RAILS_ENV"] == "test"

        Faraday.new("http://localhost:5000")

      else
        # Faraday.new("https://gear-up-be.herokuapp.com")
        Faraday.new("http://localhost:5000")
      end

    end

    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
