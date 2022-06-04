class GearUpFacade
  def self.user_trips(user_id)
    GearUpService.user_trips(user_id)[:data].map do |data|
      Trip.new(data)
    end
  end
end
