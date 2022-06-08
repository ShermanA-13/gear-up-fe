class TripFacade
<<<<<<< HEAD
  def self.get_trip_by_id(id)
    trip_data = TripService.get_trip_by_id(id)
    Trip.new(
      id: trip_data[:data][:id], attributes: {
        name: trip_data[:data][:attributes][:name],
        description: trip_data[:data][:attributes][:description],
        start_date: trip_data[:data][:attributes][:start_date],
        end_date: trip_data[:data][:attributes][:end_date]
      }
    )
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

  def self.create_trip(params)
    json = TripService.create(params)
    Trip.new(json[:data])
  end

  def self.destroy(id)
    TripService.destroy(id)
  end

  def self.update(params)
    json = TripService.update_trip(params)
    Trip.new(json[:data])
=======
  def self.data_hash(trips)
    if trips != []
      trips.map { |trip| trip.data_hash }
    end
  end

  def self.get_trip_by_id(id)
    trip_data = TripService.get_trip_by_id(id)[:data]
    trip_data[:attributes][:id] = trip_data[:id]
    Trip.new(trip_data[:attributes])
  end

<<<<<<< HEAD
  def self.trips_by_user_id(id)
    trip_data = TripService.trips_by_user_id(id)[:data]
    if trip_data
      trip_data.map do |trip|
        trip[:attributes][:id] = trip[:id]
        Trip.new(trip[:attributes])
      end
    end
>>>>>>> 44e9de7 (merged main with branch rebase: routes)
=======
  def self.trips_by_user_id(user_id)
    TripService.trips_by_user_id(user_id)[:data].map do |data|
      Trip.new(data)
    end
>>>>>>> e52e69e (merged main with branch rebase: routes)
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

  def self.edit_items_on_trip(id, items)
    TripService.edit_items_on_trip(id, items)
  end
end
