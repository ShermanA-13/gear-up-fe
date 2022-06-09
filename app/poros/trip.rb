class Trip
  attr_reader :id, :name, :description, :location, :start_date, :end_date, :host_id, :area_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @start_date = data[:attributes][:start_date]
    @end_date = data[:attributes][:end_date]
    @host_id = data[:attributes][:host_id]
    @area_id = data[:attributes][:area_id]
  end
end
