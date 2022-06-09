class TripInfo
  attr_reader :id, :name, :start_date, :end_date, :host, :description, :lat, :long, :area, :state, :users, :items, :weather, :url

  def initialize(data)
    # binding.pry
    @id = data[:id]
    @name = data[:name]
    @start_date = data[:start_date]
    @end_date = data[:end_date]
    @host = data[:host]
    @description = data[:description]
    @lat = data[:lat]
    @long = data[:long]
    @area = data[:area]
    @url = data[:url]
    @state = data[:state]
    @users = create_users(data[:users])
    @items = create_items(data[:items])
    @weather = if data[:weather].instance_of?(String)
      data[:weather]
    else
      create_weather(data[:weather][:forecast])
    end
    # require "pry"; binding.pry
  end

  def create_users(users)
    users.map do |user|
      data = {
        id: user[:id],
        attributes: {
          first_name: user[:first_name], last_name: user[:last_name], user_photo: user[:user_photo], email: user[:email]
        }
      }
      User.new(data)
    end
  end

  def create_items(items)
    items.map do |item|
      data = {
        id: item[:id],
        attributes: {
          name: item[:name],
          description: item[:description], count: item[:count],
          category: item[:category],
          owner: item[:owner]
        }
      }
      Item.new(data)
    end
  end

  def create_weather(weather)
    weather.map do |weather|
      Weather.new(weather)
    end
  end
end
