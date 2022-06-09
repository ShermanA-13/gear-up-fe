class BaseService
  class << self
    private

    def conn
      Faraday.new(ENV['BASE_URL'])
    end

    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
