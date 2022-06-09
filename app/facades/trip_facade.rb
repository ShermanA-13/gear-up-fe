class TripFacade
  def self.get_trip_by_id(id)
    trip_data = TripService.get_trip_by_id(id)[:data]
    trip_data[:attributes][:id] = trip_data[:id]
    Trip.new(trip_data)
  end

  def self.get_all_trip_info(id)
    trip = TripService.get_all_trip_info(id)
    TripInfo.new(trip)
  end

  def self.trips_by_user_id(user_id)
    TripService.trips_by_user_id(user_id)[:data].map do |data|
      Trip.new(data)
    end
  end

  def destroy(id)
    TripService.destroy(id)
  end

  def update(id)
    json = TripService.update(id)
    Trip.new(json[:data])
  end

  def self.add_items_to_trip(id, items)
    TripService.add_items_to_trip(id, items)
  end
end
