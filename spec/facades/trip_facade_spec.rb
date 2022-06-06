require "rails_helper"

RSpec.describe "trip_facade" do
  it "creates a trip when given trip id", :vcr do
    trip = TripFacade.get_trip_by_id(1)

    expect(trip.name).to be_a(String)
    expect(trip.description).to be_a(String)
    expect(trip.start_date).to be_a(String)
    expect(trip.end_date).to be_a(String)
  end
end
