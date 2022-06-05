require "rails_helper"

RSpec.describe "trip_facade" do
  it "makes Trip poros" do
    trip_data = TripFacade.get_trip_by_id(1)
    expect(trip.name).to be_a(String)
    expect(trip.location).to be_a(String)
    expect(trip.description).to be_a(String)
  end
end
