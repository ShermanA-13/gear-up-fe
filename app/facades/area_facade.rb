class AreaFacade
  class << self
    def search(name)
      area = AreaService.search(name)
      if area[:errors].present?
        Error.new(area[:errors])
      else
        area[:data][0..14].map do |data|
          Area.new(data)
        end
      end
    end

    def get_area_by_id(id)
      area_data = AreaService.area_by_id(id)
      if area_data[:errors].present?
        Error.new(area_data[:errors])
      else
        Area.new(area_data[:data])
      end
    end
  end
end
