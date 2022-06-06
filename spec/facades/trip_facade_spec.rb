require "rails_helper"

RSpec.describe "trip_facade" do
  before :each do
    data = {name: "Steve's Route", location: "some location", description: "test desctiption", start_date: "2022-07-10", end_date: "2022-07-20"}
    @created_trip = TripFacade.created_trip(data)
  end
  it "makes Trip poros", :vcr do
    trip_data = TripFacade.get_trip_by_id(1)
    expect(trip.name).to be_a(String)
    expect(trip.location).to be_a(String)
    expect(trip.description).to be_a(String)
  end
end
