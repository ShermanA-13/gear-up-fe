class GearUpFacade

  def self.find_item(user_id, item_id)
    data = GearUpService.find_item(user_id, item_id)[:data]
    Item.new(data)
  end

  def self.items(user_id)
    GearUpService.items(user_id)[:data].map do |data|
      Item.new(data)
    end
  end

  def self.find_user(user_id)
    data = GearUpService.find_user(user_id)[:data]
    User.new(data)
  end

  def self.users
    GearUpService.users[:data].map do |data|
      User.new(data)
    end
  end

  def self.user_trips(user_id)
    GearUpService.user_trips(user_id)[:data].map do |data|
      Trip.new(data)
    end
  end
end
