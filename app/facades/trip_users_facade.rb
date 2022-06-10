class TripUsersFacade
  def self.add_trip_users(users, id)
    TripUsersService.create_trip_users(users, id)
  end

  def self.trip_user(id)
    json = TripUsersService.trip_user(id)
    json[:data].map do |data|
      User.new(data)
    end
  end

  def self.edit_invitees(user_ids, id)
    TripUsersService.edit_invitees(user_ids, id)
  end
end
