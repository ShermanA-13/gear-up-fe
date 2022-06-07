class TripFacade
  def self.get_trip_by_id(id)
    trip_data = TripService.get_trip_by_id(id)
    Trip.new(id: trip_data[:id], attributes: {name: trip_data[:name]})
  end

  def self.trips_by_user_id(user_id)
    TripService.trips_by_user_id(user_id)[:data].map do |data|
      Trip.new(data)
    end
  end

  def self.create_trip(params)
    json = TripService.create(params)
    Trip.new(json[:data])
  end

  def destroy(id)
    TripService.destroy(id)
  end

  def update(id)
    json = TripService.update(id)
    Trip.new(json[:data])
  end
end
