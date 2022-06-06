class AreaFacade
  class << self
    def search(name)
      AreaService.search(name)[:data][0..14].map do |data|
        Area.new(data)
      end
    end
  end
end
