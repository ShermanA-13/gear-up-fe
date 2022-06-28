class Area
  attr_reader :id, :name, :state, :url, :lat, :long

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @state = data[:attributes][:state]
    @url = data[:attributes][:url]
    @lat = data[:attributes][:lat]
    @long = data[:attributes][:long]
  end
end
