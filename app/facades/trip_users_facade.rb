class TripUsersFacade
  def self.add_trip_users(users, id)
    TripUsersService.create_trip_users(users, id)
  end

  def self.edit_invitees(users, id)
    TripUsersService.edit_invitees(users, id)
  end
end
