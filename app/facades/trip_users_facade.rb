class TripUsersFacade
  def self.add_trip_users(users, id)
    TripUsersService.create_trip_users(users, id)
  end
end
