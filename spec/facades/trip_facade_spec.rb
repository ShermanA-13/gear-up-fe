require "rails_helper"

RSpec.describe "trip_facade" do
  xit "creates a trip when given trip id", :vcr do
    trip = TripFacade.get_trip_by_id(1)

    expect(trip.name).to be_a(String)
    expect(trip.description).to be_a(String)
    expect(trip.start_date).to be_a(String)
    expect(trip.end_date).to be_a(String)
  end

  it 'returns all info about a trip' do
    trip = TripFacade.get_all_trip_info(1)

    # require "pry"; binding.pry
  end
end
