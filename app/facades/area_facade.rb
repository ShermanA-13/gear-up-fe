class AreaFacade
  class << self
    def search(name)
      AreaService.search(name)[:data][0..14].map do |data|
        Area.new(data)
      end
    end


    def get_area_by_id(id)
      area_data = AreaService.area_by_id(id)[:data]
      Area.new(area_data)

    end
  end
end
