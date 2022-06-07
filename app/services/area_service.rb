class AreaService < BaseService
  class << self
    def search(name)
      response = conn.get("/api/v1/areas/find_all?name=#{name}")
      get_json(response)
    end

    def area_by_id(id)
      response = conn.get("/api/v1/areas/#{id}")
      get_json(response)
    end
  end
end
