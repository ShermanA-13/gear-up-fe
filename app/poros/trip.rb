class Trip
  attr_reader :name, :id, :location, :start_date, :end_date, :host_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @location = data[:attributes][:location]
    @start_date = data[:attributes][:start_date]
    @end_date = data[:attributes][:end_date]
    @host_id = data[:attributes][:host_id]
  end
end
